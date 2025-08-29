import { test, expect } from '@playwright/test';

test.describe('Homepage', () => {
  test('should display the homepage correctly', async ({ page }) => {
    await page.goto('/');

    // Check that the page loads
    await expect(page).toHaveTitle(/One Mission/);

    // Check for the main heading
    const heading = page.getByRole('heading', { name: 'Welcome to One Mission' });
    await expect(heading).toBeVisible();

    // Check for the One Mission text
    const missionText = page.getByText('One Mission');
    await expect(missionText).toBeVisible();

    // Check for the Get Started button
    const button = page.getByRole('button', { name: 'Get Started' });
    await expect(button).toBeVisible();
  });

  test('should have proper page structure', async ({ page }) => {
    await page.goto('/');

    // Check that the main element exists
    const main = page.locator('main');
    await expect(main).toBeVisible();

    // Check that the page has proper layout classes
    await expect(main).toHaveClass(/flex/);
    await expect(main).toHaveClass(/min-h-screen/);
  });

  test('should be responsive', async ({ page }) => {
    await page.goto('/');

    // Test desktop view
    await page.setViewportSize({ width: 1280, height: 720 });
    const heading = page.getByRole('heading', { name: 'Welcome to One Mission' });
    await expect(heading).toBeVisible();

    // Test mobile view
    await page.setViewportSize({ width: 375, height: 667 });
    await expect(heading).toBeVisible();
  });
});
