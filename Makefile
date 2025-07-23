# Makefile - автоматизация деплоя

PROJECT_NAME = volynskiy-business-site
BRANCH = volynskiy-business-site

deploy:
	git add .
	git commit -m "fix: latest production changes"
	git push origin $(BRANCH)
	wrangler pages deploy . --project-name=$(PROJECT_NAME) --branch=$(BRANCH)
