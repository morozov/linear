tap/linear.tap: boot.bas breath.tap
# Create a temporary file first in order to make sure the target file
# gets created only after the entire job has succeeded
	$(eval TMPFILE=$(shell tempfile).tap)

	bas2tap -sLinear -a10 boot.bas $(TMPFILE)
	cat breath.tap >> $(TMPFILE)

# Rename the temporary file to the target name
	mv $(TMPFILE) $@

boot.bas: boot.bin src/boot.bas
# Replace the __LOADER__ placeholder with the machine codes with bytes represented as {XX}
	sed s/__LOADER__/$(shell hexdump -ve '1/1 "{%02x}"' $<)/ src/boot.bas > $@

boot.bin: src/boot.asm src/loader.asm
	pasmo --bin src/boot.asm $@

breath.tap: breath.000
	0totap -o breath.tap breath.000

breath.000: scr/breath.bin
	rm -f breath.000
	binto0 scr/breath.bin 4
	mv scr/breath.000 $@

clean:
	rm -f \
		*.000 \
		*.bas \
		*.bin \
		*.tap
