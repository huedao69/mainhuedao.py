name: chay

on:
  workflow_dispatch: {}
  schedule:
    - cron: "0 */12 * * *"   # tự chạy 12 giờ/lần

jobs:
  run:
    runs-on: ubuntu-latest
    env:
      OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
      WORDPRESS_BASE_URL: ${{ secrets.WORDPRESS_BASE_URL }}
      WORDPRESS_USERNAME: ${{ secrets.WORDPRESS_USERNAME }}
      WORDPRESS_APP_PASSWORD: ${{ secrets.WORDPRESS_APP_PASSWORD }}

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Run
        run: |
          ls -la
          python main.py --once
