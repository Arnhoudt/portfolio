const plugin = require('tailwindcss/plugin');

module.exports = {
  content: ["./templates/**/*.{html,js}"],
  theme: {
    container: {
      center: true,
      padding: {
        DEFAULT: '1rem',
        sm: '2rem',
        lg: '4rem',
        xl: '5rem',
        '2xl': '8rem',
      },
    },
  },
  plugins: [
    plugin(function ({ addUtilities }) {
      addUtilities({
        '.bg-overlay': {
          'background': 'radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.1) 200%);',
          'background-position': 'center',
          'background-size': 'cover',
        },
      });
    }),
  ],
}
