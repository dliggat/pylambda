STAGING_DIR := package
BUILDS_DIR  := builds
MODULE      := pylambda
PIP         := pip install -r requirements.txt

.PHONY: init test clean build

init:
	$(PIP)

test:
	nosetests -s tests

clean:
	rm -rf $(STAGING_DIR)
	rm -rf $(BUILDS_DIR)

build:
	mkdir -p $(STAGING_DIR)
	mkdir -p $(BUILDS_DIR)
	echo "[install]" >> $(STAGING_DIR)/setup.cfg
	echo "prefix="   >> $(STAGING_DIR)/setup.cfg
	$(PIP) -t $(STAGING_DIR)
	cp *.py $(STAGING_DIR)
	cp -R $(MODULE) $(STAGING_DIR)
	$(eval $@FILE := deploy-$(shell date +%Y-%m-%d_%H-%M-%S).zip)
	cd $(STAGING_DIR); zip -r $($@FILE) ./*; mv *.zip ../$(BUILDS_DIR)
	@echo "Built $(BUILDS_DIR)/$($@FILE)"
	rm -rf $(STAGING_DIR)
