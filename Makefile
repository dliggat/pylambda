DEPLOY_DIR := deploy
MODULE     := pylambda
PIP        := pip install -r requirements.txt

init:
	$(PIP)

test:
	nosetests -s tests

clean:
	rm -rf $(DEPLOY_DIR)

build: clean
	mkdir -p $(DEPLOY_DIR)
	$(PIP) -t $(DEPLOY_DIR)
	cp *.py $(DEPLOY_DIR)
	cp -R $(MODULE) $(DEPLOY_DIR)
