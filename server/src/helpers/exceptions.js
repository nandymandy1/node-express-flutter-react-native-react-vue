export function RES_EXCEPTION(message, status) {
    this.name = 'RES_EXCEPTION';
    this.message = message;
    this.status = status;
}