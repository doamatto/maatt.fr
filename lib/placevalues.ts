export default function format(x:Number) {
  if (!x) return
  return x.toLocaleString('fr-FR')
}

// Adapted from https://stackoverflow.com/questions/2901102/how-to-print-a-number-with-commas-as-thousands-separators-in-javascript