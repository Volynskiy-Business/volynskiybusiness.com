# Makefile — автоматизация деплоя и Git операций

PROJECT_NAME = volynskiy-business-site
BRANCH = volynskiy-business-site

# Пример: make commit MSG="fix: update index page"
commit:
	@if git diff --quiet && git diff --cached --quiet; then \
		echo "🟢 No changes to commit."; \
	else \
		git add . && \
		git commit -m "$(MSG)"; \
	fi

push:
	git push origin $(BRANCH)

cloudflare:
	wrangler pages deploy . --project-name=$(PROJECT_NAME) --branch=$(BRANCH)

deploy: commit push cloudflare
