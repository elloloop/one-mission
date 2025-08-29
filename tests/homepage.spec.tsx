import { render, screen } from '@testing-library/react';
import HomePage from '@/app/page';

// Mock the Button component since we're testing the page, not the button
jest.mock('@/shared/components/ui/button', () => ({
  Button: ({ children, ...props }: any) => (
    <button {...props}>{children}</button>
  ),
}));

describe('HomePage', () => {
  it('renders the main heading', () => {
    render(<HomePage />);
    const heading = screen.getByRole('heading', { level: 1 });
    expect(heading).toBeInTheDocument();
    expect(heading).toHaveTextContent('Welcome to One Mission');
  });

  it('renders the One Mission text', () => {
    render(<HomePage />);
    const missionText = screen.getByText('One Mission');
    expect(missionText).toBeInTheDocument();
  });

  it('renders the Get Started button', () => {
    render(<HomePage />);
    const button = screen.getByRole('button', { name: /get started/i });
    expect(button).toBeInTheDocument();
  });

  it('has the correct main element structure', () => {
    render(<HomePage />);
    const main = screen.getByRole('main');
    expect(main).toBeInTheDocument();
    expect(main).toHaveClass('flex', 'min-h-screen', 'flex-col', 'items-center', 'justify-center', 'p-24');
  });
});
