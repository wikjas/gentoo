# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: gnome2-utils.eclass
# @MAINTAINER:
# gnome@gentoo.org
# @SUPPORTED_EAPIS: 5 6 7
# @PROVIDES: xdg-utils
# @BLURB: Auxiliary functions commonly used by Gnome packages.
# @DESCRIPTION:
# This eclass provides a set of auxiliary functions needed by most Gnome
# packages. It may be used by non-Gnome packages as needed for handling various
# Gnome stack related functions such as:
#  * GSettings schemas management
#  * GConf schemas management
#  * scrollkeeper (old Gnome help system) management

[[ ${EAPI} == 5 ]] && inherit multilib
# eutils.eclass: emktemp
# toolchain-funs.eclass: tc-is-cross-compiler
# xdg-utils.eclass: xdg_environment_reset, xdg_icon_cache_update
inherit eutils toolchain-funcs xdg-utils

case ${EAPI} in
	5|6|7) ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

# @ECLASS-VARIABLE: GCONFTOOL_BIN
# @INTERNAL
# @DESCRIPTION:
# Path to gconftool-2
: ${GCONFTOOL_BIN:="/usr/bin/gconftool-2"}

# @ECLASS-VARIABLE: SCROLLKEEPER_DIR
# @INTERNAL
# @DESCRIPTION:
# Directory where scrollkeeper-update should do its work
: ${SCROLLKEEPER_DIR:="/var/lib/scrollkeeper"}

# @ECLASS-VARIABLE: SCROLLKEEPER_UPDATE_BIN
# @INTERNAL
# @DESCRIPTION:
# Path to scrollkeeper-update
: ${SCROLLKEEPER_UPDATE_BIN:="/usr/bin/scrollkeeper-update"}

# @ECLASS-VARIABLE: GLIB_COMPILE_SCHEMAS
# @INTERNAL
# @DESCRIPTION:
# Path to glib-compile-schemas
: ${GLIB_COMPILE_SCHEMAS:="/usr/bin/glib-compile-schemas"}

# @ECLASS-VARIABLE: GNOME2_ECLASS_SCHEMAS
# @INTERNAL
# @DEFAULT_UNSET
# @DESCRIPTION:
# List of GConf schemas provided by the package

# @ECLASS-VARIABLE: GNOME2_ECLASS_ICONS
# @INTERNAL
# @DEFAULT_UNSET
# @DESCRIPTION:
# List of icons provided by the package

# @ECLASS-VARIABLE: GNOME2_ECLASS_SCROLLS
# @INTERNAL
# @DEFAULT_UNSET
# @DESCRIPTION:
# List of scrolls (documentation files) provided by the package

# @ECLASS-VARIABLE: GNOME2_ECLASS_GLIB_SCHEMAS
# @INTERNAL
# @DEFAULT_UNSET
# @DESCRIPTION:
# List of GSettings schemas provided by the package

# @ECLASS-VARIABLE: GNOME2_ECLASS_GDK_PIXBUF_LOADERS
# @INTERNAL
# @DEFAULT_UNSET
# @DESCRIPTION:
# List of gdk-pixbuf loaders provided by the package


# @FUNCTION: gnome2_environment_reset
# @DESCRIPTION:
# Reset various variables inherited from root's evironment to a reasonable
# default for ebuilds to help avoid access violations and test failures.
gnome2_environment_reset() {
	xdg_environment_reset

	# Respected by >=glib-2.30.1-r1
	export G_HOME="${T}"

	# GST_REGISTRY is to work around gst utilities trying to read/write /root
	export GST_REGISTRY="${T}/registry.xml"

	# Ensure we don't rely on dconf/gconf while building, bug #511946
	export GSETTINGS_BACKEND="memory"

	if has ${EAPI} 6 7; then
		# Try to cover the packages honoring this variable, bug #508124
		export GST_INSPECT="$(type -P true)"

		# Stop relying on random DISPLAY variable values, bug #534312
		unset DISPLAY
	fi
}

# @FUNCTION: gnome2_gconf_savelist
# @DESCRIPTION:
# Find the GConf schemas that are about to be installed and save their location
# in the GNOME2_ECLASS_SCHEMAS environment variable.
# This function should be called from pkg_preinst.
gnome2_gconf_savelist() {
	pushd "${ED}" > /dev/null || die
	export GNOME2_ECLASS_SCHEMAS=$(find 'etc/gconf/schemas/' -name '*.schemas' 2> /dev/null)
	popd > /dev/null || die
}

# @FUNCTION: gnome2_gconf_install
# @DESCRIPTION:
# Applies any schema files installed by the current ebuild to Gconf's database
# using gconftool-2.
# This function should be called from pkg_postinst.
gnome2_gconf_install() {
	local updater="${EROOT%/}${GCONFTOOL_BIN}"

	if [[ -z "${GNOME2_ECLASS_SCHEMAS}" ]]; then
		debug-print "No GNOME 2 GConf schemas found"
		return
	fi

	if tc-is-cross-compiler ; then
		ewarn "Updating of GNOME 2 GConf schemas skipped due to cross-compilation."
		ewarn "You might want to run gconftool-2 manually on the target for"
		ewarn "your final image and re-run it when packages installing"
		ewarn "GNOME 2 GConf schemas get upgraded or added to the image."
		return
	fi

	if [[ ! -x "${updater}" ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	# We are ready to install the GCONF Scheme now
	unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
	export GCONF_CONFIG_SOURCE="$("${updater}" --get-default-source | sed "s;:/;:${ROOT%/}/;")"

	einfo "Installing GNOME 2 GConf schemas"

	local F
	for F in ${GNOME2_ECLASS_SCHEMAS}; do
		if [[ -e "${EROOT%/}/${F}" ]]; then
			debug-print "Installing schema: ${F}"
			"${updater}" --makefile-install-rule "${EROOT%/}/${F}" 1>/dev/null
		fi
	done

	# have gconf reload the new schemas
	pids=$(pgrep -x gconfd-2)
	if [[ $? == 0 ]] ; then
		ebegin "Reloading GConf schemas"
		kill -HUP ${pids}
		eend $?
	fi
}

# @FUNCTION: gnome2_gconf_uninstall
# @DESCRIPTION:
# Removes schema files previously installed by the current ebuild from Gconf's
# database.
gnome2_gconf_uninstall() {
	local updater="${EROOT%/}${GCONFTOOL_BIN}"

	if [[ -z "${GNOME2_ECLASS_SCHEMAS}" ]]; then
		debug-print "No GNOME 2 GConf schemas found"
		return
	fi

	if tc-is-cross-compiler ; then
		ewarn "Removal of GNOME 2 GConf schemas skipped due to cross-compilation."
		ewarn "You might want to run gconftool-2 manually on the target for"
		ewarn "your final image to uninstall this package's schemas."
		return
	fi

	if [[ ! -x "${updater}" ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
	export GCONF_CONFIG_SOURCE="$("${updater}" --get-default-source | sed "s;:/;:${ROOT%/}/;")"

	einfo "Uninstalling GNOME 2 GConf schemas"

	local F
	for F in ${GNOME2_ECLASS_SCHEMAS}; do
		if [[ -e "${EROOT%/}/${F}" ]]; then
			debug-print "Uninstalling gconf schema: ${F}"
			"${updater}" --makefile-uninstall-rule "${EROOT%/}/${F}" 1>/dev/null
		fi
	done

	# have gconf reload the new schemas
	pids=$(pgrep -x gconfd-2)
	if [[ $? == 0 ]] ; then
		ebegin "Reloading GConf schemas"
		kill -HUP ${pids}
		eend $?
	fi
}

# @FUNCTION: gnome2_omf_fix
# @DESCRIPTION:
# Workaround applied to Makefile rules in order to remove redundant
# calls to scrollkeeper-update and sandbox violations.
# This function should be called from src_prepare.
gnome2_omf_fix() {
	local omf_makefiles filename

	omf_makefiles="$@"

	if [[ -f ${S}/omf.make ]] ; then
		omf_makefiles="${omf_makefiles} ${S}/omf.make"
	fi

	if [[ -f ${S}/gnome-doc-utils.make ]] ; then
		omf_makefiles="${omf_makefiles} ${S}/gnome-doc-utils.make"
	fi

	# testing fixing of all makefiles found
	# The sort is important to ensure .am is listed before the respective .in for
	# maintainer mode regeneration not kicking in due to .am being newer than .in
	for filename in $(find "${S}" -name "Makefile.in" -o -name "Makefile.am" |sort) ; do
		omf_makefiles="${omf_makefiles} ${filename}"
	done

	ebegin "Fixing OMF Makefiles"

	local retval=0
	local fails=( )

	for omf in ${omf_makefiles} ; do
		sed -i -e 's:scrollkeeper-update:true:' "${omf}"
		retval=$?

		if [[ $retval -ne 0 ]] ; then
			debug-print "updating of ${omf} failed"

			# Add to the list of failures
			fails[$(( ${#fails[@]} + 1 ))]=$omf

			retval=2
		fi
	done

	eend $retval

	for f in "${fails[@]}" ; do
		eerror "Failed to update OMF Makefile $f"
	done
}

# @FUNCTION: gnome2_scrollkeeper_savelist
# @DESCRIPTION:
# Find the scrolls that are about to be installed and save their location
# in the GNOME2_ECLASS_SCROLLS environment variable.
# This function should be called from pkg_preinst.
gnome2_scrollkeeper_savelist() {
	pushd "${ED}" > /dev/null || die
	export GNOME2_ECLASS_SCROLLS=$(find 'usr/share/omf' -type f -name "*.omf" 2> /dev/null)
	popd > /dev/null || die
}

# @FUNCTION: gnome2_scrollkeeper_update
# @DESCRIPTION:
# Updates the global scrollkeeper database.
# This function should be called from pkg_postinst and pkg_postrm.
gnome2_scrollkeeper_update() {
	local updater="${EROOT%/}${SCROLLKEEPER_UPDATE_BIN}"

	if [[ -z "${GNOME2_ECLASS_SCROLLS}" ]]; then
		debug-print "No scroll cache to update"
		return
	fi

	if tc-is-cross-compiler ; then
		ewarn "Updating of scrollkeeper database skipped due to cross-compilation."
		ewarn "You might want to run scrollkeeper-update manually on the target"
		ewarn "for your final image and re-run it when packages installing"
		ewarn "scrollkeeper OMF files get upgraded or added to the image."
		return
	fi

	if [[ ! -x "${updater}" ]] ; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating scrollkeeper database ..."
	"${updater}" -q -p "${EROOT%/}${SCROLLKEEPER_DIR}"
	eend $?
}

# @FUNCTION: gnome2_schemas_savelist
# @DESCRIPTION:
# Find if there is any GSettings schema to install and save the list in
# GNOME2_ECLASS_GLIB_SCHEMAS variable. This is only necessary for eclass
# implementations that call gnome2_schemas_update conditionally.
# This function should be called from pkg_preinst.
gnome2_schemas_savelist() {
	pushd "${ED}" > /dev/null || die
	export GNOME2_ECLASS_GLIB_SCHEMAS=$(find 'usr/share/glib-2.0/schemas' -name '*.gschema.xml' 2>/dev/null)
	popd > /dev/null || die
}

# @FUNCTION: gnome2_schemas_update
# @DESCRIPTION:
# Updates GSettings schemas.
# This function should be called from pkg_postinst and pkg_postrm.
gnome2_schemas_update() {
	local updater="${EROOT%/}${GLIB_COMPILE_SCHEMAS}"

	if tc-is-cross-compiler ; then
		ewarn "Updating of GSettings schemas skipped due to cross-compilation."
		ewarn "You might want to run glib-compile-schemas manually on the target"
		ewarn "for your final image and re-run it when packages installing"
		ewarn "GSettings schemas get upgraded or added to the image."
		return
	fi

	if [[ ! -x ${updater} ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating GSettings schemas"
	${updater} --allow-any-name "$@" "${EROOT%/}/usr/share/glib-2.0/schemas" &>/dev/null
	eend $?
}

# @FUNCTION: gnome2_gdk_pixbuf_savelist
# @DESCRIPTION:
# Find if there is any gdk-pixbuf loader to install and save the list in
# GNOME2_ECLASS_GDK_PIXBUF_LOADERS variable.
# This function should be called from pkg_preinst.
gnome2_gdk_pixbuf_savelist() {
	pushd "${ED}" > /dev/null || die
	export GNOME2_ECLASS_GDK_PIXBUF_LOADERS=$(find usr/lib*/gdk-pixbuf-2.0 -type f 2>/dev/null)
	popd > /dev/null || die
}

# @FUNCTION: gnome2_gdk_pixbuf_update
# @DESCRIPTION:
# Updates gdk-pixbuf loader cache if GNOME2_ECLASS_GDK_PIXBUF_LOADERS has some.
# This function should be called from pkg_postinst and pkg_postrm.
gnome2_gdk_pixbuf_update() {
	local updater="${EROOT%/}/usr/bin/${CHOST}-gdk-pixbuf-query-loaders"
	[[ -x ${updater} ]] || updater="${EROOT%/}/usr/bin/gdk-pixbuf-query-loaders"

	if [[ -z ${GNOME2_ECLASS_GDK_PIXBUF_LOADERS} ]]; then
		debug-print "gdk-pixbuf loader cache does not need an update"
		return
	fi

	if tc-is-cross-compiler ; then
		ewarn "Updating of gdk-pixbuf loader cache skipped due to cross-compilation."
		ewarn "You might want to run gdk-pixbuf-query-loaders manually on the target"
		ewarn "for your final image and re-run it when packages installing"
		ewarn "gdk-pixbuf loaders get upgraded or added to the image."
		return
	fi

	if [[ ! -x ${updater} ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating gdk-pixbuf loader cache"
	local tmp_file=$(emktemp)
	${updater} 1> "${tmp_file}" &&
	chmod 0644 "${tmp_file}" &&
	cp -f "${tmp_file}" "${EROOT%/}/usr/$(get_libdir)/gdk-pixbuf-2.0/2.10.0/loaders.cache" &&
	rm "${tmp_file}" # don't replace this with mv, required for SELinux support
	eend $?
}

# @FUNCTION: gnome2_query_immodules_gtk2
# @DESCRIPTION:
# Updates gtk2 immodules/gdk-pixbuf loaders listing.
gnome2_query_immodules_gtk2() {
	local updater=${EPREFIX}/usr/bin/${CHOST}-gtk-query-immodules-2.0
	[[ -x ${updater} ]] || updater=${EPREFIX}/usr/bin/gtk-query-immodules-2.0

	if [[ ! -x ${updater} ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating gtk2 input method module cache"
	GTK_IM_MODULE_FILE="${EROOT%/}/usr/$(get_libdir)/gtk-2.0/2.10.0/immodules.cache" \
		"${updater}" --update-cache
	eend $?
}

# @FUNCTION: gnome2_query_immodules_gtk3
# @DESCRIPTION:
# Updates gtk3 immodules/gdk-pixbuf loaders listing.
gnome2_query_immodules_gtk3() {
	local updater=${EPREFIX}/usr/bin/${CHOST}-gtk-query-immodules-3.0
	[[ -x ${updater} ]] || updater=${EPREFIX}/usr/bin/gtk-query-immodules-3.0

	if [[ ! -x ${updater} ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating gtk3 input method module cache"
	GTK_IM_MODULE_FILE="${EROOT%/}/usr/$(get_libdir)/gtk-3.0/3.0.0/immodules.cache" \
		"${updater}" --update-cache
	eend $?
}

# @FUNCTION: gnome2_giomodule_cache_update
# @DESCRIPTION:
# Updates glib's gio modules cache.
# This function should be called from pkg_postinst and pkg_postrm.
gnome2_giomodule_cache_update() {
	local updater="${EROOT%/}/usr/bin/${CHOST}-gio-querymodules"
	[[ -x ${updater} ]] || updater="${EROOT%/}/usr/bin/gio-querymodules"

	if tc-is-cross-compiler ; then
		ewarn "Updating of GIO modules cache skipped due to cross-compilation."
		ewarn "You might want to run gio-querymodules manually on the target for"
		ewarn "your final image for performance reasons and re-run it when packages"
		ewarn "installing GIO modules get upgraded or added to the image."
		return
	fi

	if [[ ! -x ${updater} ]]; then
		debug-print "${updater} is not executable"
		return
	fi

	ebegin "Updating GIO modules cache"
	${updater} "${EROOT%/}"/usr/$(get_libdir)/gio/modules
	eend $?
}

# @FUNCTION: gnome2_disable_deprecation_warning
# @DESCRIPTION:
# Disable deprecation warnings commonly found in glib based packages.
# Should be called from src_prepare.
gnome2_disable_deprecation_warning() {
	local retval=0
	local fails=( )
	local makefile

	ebegin "Disabling deprecation warnings"
	# The sort is important to ensure .am is listed before the respective .in for
	# maintainer mode regeneration not kicking in due to .am being newer than .in
	while read makefile ; do
		if ! grep -qE "(DISABLE_DEPRECATED|GSEAL_ENABLE)" "${makefile}"; then
			continue
		fi

		LC_ALL=C sed -r -i \
			-e 's:-D[A-Z_]+_DISABLE_DEPRECATED:$(/bin/true):g' \
			-e 's:-DGSEAL_ENABLE(=[A-Za-z0-9_]*)?:$(/bin/true):g' \
			-i "${makefile}"

		if [[ $? -ne 0 ]]; then
			# Add to the list of failures
			fails+=( "${makefile}" )
			retval=2
		fi
	done < <(find "${S}" -name "Makefile.in" \
		-o -name "Makefile.am" -o -name "Makefile.decl" \
		| sort; [[ -f "${S}"/configure ]] && echo configure)
# TODO: sedding configure.ac can trigger maintainer mode; bug #439602
#		-o -name "configure.ac" -o -name "configure.in" \
#		| sort; echo configure)
	eend ${retval}

	for makefile in "${fails[@]}" ; do
		ewarn "Failed to disable deprecation warnings in ${makefile}"
	done
}

case ${EAPI} in
5|6)

# @FUNCTION: gnome2_icon_savelist
# @DESCRIPTION:
# Find the icons that are about to be installed and save their location
# in the GNOME2_ECLASS_ICONS environment variable. This is only
# necessary for eclass implementations that call
# gnome2_icon_cache_update conditionally.
# This function should be called from pkg_preinst.
gnome2_icon_savelist() {
	pushd "${ED}" > /dev/null || die
	export GNOME2_ECLASS_ICONS=$(find 'usr/share/icons' -maxdepth 1 -mindepth 1 -type d 2> /dev/null)
	popd > /dev/null || die
}

# @FUNCTION: gnome2_icon_cache_update
# @DESCRIPTION:
# Updates Gtk+ icon cache files under /usr/share/icons.
# Deprecated. Please use xdg_icon_cache_update from xdg-utils.eclass
gnome2_icon_cache_update() {
	xdg_icon_cache_update
}

;;
esac
