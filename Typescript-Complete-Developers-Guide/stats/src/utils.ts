export const dateStringToDate = (dateStr: string): Date => {
  const dateParts = dateStr.split('/').map((value: string): number => {
    return parseInt(value);
  })
  return new Date(dateParts[2], dateParts[1] -1, dateParts[0])
}