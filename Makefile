STAGING_DIR := package
BUILDS_DIR  := builds
MODULE      := pylambda
PIP         := pip install -r
ARN         := arn:aws:lambda:us-west-2:424087752812:function:dliggat-lambda-stack-MyLambdaFunction-Z26IR0XSGDEH

.PHONY: init test clean build deploy

init:
	$(PIP) requirements/dev.txt

test:
	py.test -rsxX -q -s tests

clean:
	rm -rf $(STAGING_DIR)
	rm -rf $(BUILDS_DIR)

build: test
	mkdir -p $(STAGING_DIR)
	mkdir -p $(BUILDS_DIR)
	echo "[install]" >> $(STAGING_DIR)/setup.cfg
	echo "prefix="   >> $(STAGING_DIR)/setup.cfg
	$(PIP) requirements/lambda.txt -t $(STAGING_DIR)
	cp *.py $(STAGING_DIR)
	cp -R $(MODULE) $(STAGING_DIR)
	$(eval $@FILE := deploy-$(shell date +%Y-%m-%d_%H-%M-%S).zip)
	cd $(STAGING_DIR); zip -r $($@FILE) ./*; mv *.zip ../$(BUILDS_DIR)
	@echo "Built $(BUILDS_DIR)/$($@FILE)"
	rm -rf $(STAGING_DIR)

deploy: build
	$(eval $@FILE := $(shell ls -t $(BUILDS_DIR) | head -n1 ))
	aws lambda update-function-code --function-name $(ARN) --zip-file "fileb://$(BUILDS_DIR)/$($@FILE)"
	@echo "Deployed $(BUILDS_DIR)/$($@FILE) to $(ARN)"
