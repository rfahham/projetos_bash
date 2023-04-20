import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 10, duration: '60s',
};

export default function () {
  http.get('https://workon.apps.tsuru.gcp.i.globo/');
  sleep(0.1);
}