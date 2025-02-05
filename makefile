# A makefile for building, testing and publishing flatpak builds.
remote=https://github.com/hamza-algohary/io.github.hamza_algohary.Coulomb

build:
	flatpak-builder --user --install --disable-cache --repo=org.flathub app/build/flatpak io.github.hamza_algohary.Coulomb/io.github.hamza_algohary.Coulomb.yaml --force-clean
debug:
	flatpak --log-session-bus run io.github.hamza_algohary.Coulomb
run:
	flatpak run io.github.hamza_algohary.Coulomb
clean:
	rm -rf org.flathub
	rm -rf .flatpak-builder
lint:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder --exceptions appstream app/src/main/resources/io.github.hamza_algohary.Coulomb.metainfo.xml
preview:
	gnome-software --show-metainfo app/src/main/resources/io.github.hamza_algohary.Coulomb.metainfo.xml
clone:
	git clone $(remote)
update:
	cd io.github.hamza_algohary.Coulomb && git pull
publish: builder lint
	cd io.github.hamza_algohary.Coulomb && git push
	echo "visit https://github.com/flathub/io.github.hamza_algohary.Coulomb and open pull request."
delete: clean
	rm -rf io.github.hamza_algohary.Coulomb