tap/linear.tap: src/boot.bas loader.tap breath.tap
# Create a temporary file first in order to make sure the target file
# gets created only after the entire job has succeeded
	$(eval TMPFILE=$(shell tempfile).tap)

	bas2tap -sLinear -a10 src/boot.bas $(TMPFILE)
	cat loader.tap >> $(TMPFILE)
	cat breath.tap >> $(TMPFILE)

# Rename the temporary file to the target name
	mv $(TMPFILE) $@

loader.tap: src/loader.asm
	pasmo --tap src/loader.asm loader.tap

breath.tap: breath.000
	0totap -o breath.tap breath.000

breath.000: scr/breath.scr
	rm -f breath.000
	binto0 scr/breath.scr 4
	mv scr/breath.000 breath.000

clean:
	rm -f \
		*.000 \
		*.tap
