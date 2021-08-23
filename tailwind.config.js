module.exports = {
  purge: [
    './src/**/*.html',
    './src/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
      fontFamily: {
        poppins: ["'Poppins'", 'ui-san-serif'],
        inter: ["'Inter'", 'ui-san-serif']
        sans: ["'Inter'", 'ui-san-serif']
      },
    extend: {
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
