install:
	# source /home/codespace/venv/bin/activate
	pip3 install --upgrade pip3 &&\
		pip3 install -r requirements.txt
	#append it to bash so every shell launches with it 
	# echo 'source /home/codespace/venv/bin/activate' >> ~/.bashrc
	cargo install mdbook
	#install node
	#curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
	#sudo apt-get install -y nodejs
	#npm install -g @githubnext/github-copilot-cli
	
	echo 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

# build:
# 	mdbook build data-eng-rust-tutorial

# serve:
# 	mdbook serve -p 8000 -n 127.0.0.1 data-eng-rust-tutorial 

format:
	@echo "Formatting with cargo"
	#./format.sh
	black *.py 
	cd desc-stat && cargo fmt --quiet

lint:
	@echo "Linting with cargo"
	@rustup component add clippy 2> /dev/null
	# ./lint.sh
	cd desc-stat && cargo clippy --all-targets --all-features --quiet -D warnings
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py

test:
	@echo "Testing with cargo"
	# ./test.sh
	python -m pytest -vv --cov=main test_*.py
	cd desc-stat && cargo test --quiet

# check-gpu-linux:
# 	sudo lshw -C display

# linkcheck:
# 	mdbook test -L data-eng-rust-tutorial

run:

	cargo run

# release:
# 	cargo build --release

# deploy:
# 	#if git is not configured, configure it
# 	if [ -z "$(git config --global user.email)" ]; then git config --global user.email "noah.gift@gmail.com" &&\
# 		 git config --global user.name "Noah Gift"; fi

# 	#install mdbook if not installed
# 	if [ ! -x "$(command -v mdbook)" ]; then cargo install mdbook; fi
# 	@echo "====> deploying to github"
# 	# if worktree exists, remove it: git worktree remove --force /tmp/book
# 	# otherwise add it: git worktree add /tmp/book gh-pages
# 	if [ -d /tmp/book ]; then git worktree remove --force /tmp/book; fi
# 	git worktree add -f /tmp/book gh-pages
# 	mdbook build data-eng-rust-tutorial
# 	rm -rf /tmp/book/*
# 	cp -rp data-eng-rust-tutorial/book/* /tmp/book/
# 	cd /tmp/book && \
# 		git add -A && \
# 		git commit -m "deployed on $(shell date) by ${USER}" && \
# 		git push origin gh-pages
# 	git update-ref -d refs/heads/gh-pages
# 	git push --force

all: install format lint test