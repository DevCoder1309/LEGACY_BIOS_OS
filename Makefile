ASM = nasm
SRC_DIR = src
BUILD_DIR = build


$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin | $(BUILD_DIR)
	dd if=$(BUILD_DIR)/main.bin of=$(BUILD_DIR)/main_floppy.img bs=512 count=1
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img


$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm | $(BUILD_DIR)
	$(ASM) -f bin $(SRC_DIR)/main.asm -o $(BUILD_DIR)/main.bin


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


clean:
	rm -rf $(BUILD_DIR)

