def app(env, start_response):
    body = env['QUERY_STRING'].split('&')
    for i in range(len(body)):
        body[i] += '\n'
        body[i] = bytes(body[i], 'ascii')
    start_response('200 OK', [('Content-type', 'text/plain')])
    return body
