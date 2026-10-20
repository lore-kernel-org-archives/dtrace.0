Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511377;
	b=B/WOu0AOlBVa8ePEAhl0Cbzw398EXrA4gxqHIT3LWZzqGDCvzrz/q6oWYX/XBW9/HNnk
	 dses13z1p85DA+mKDLPwY5rt7aN12Z0lvAaiL2EEYJHxyasjzZkd4LulLiak5nzCASROH
	 UVBeqPY6ISB7jSCRvFtfLHkkzOCzSGokhXFbp7lBaIXzBCTexhGrai6tR6jq3h85NUXDP
	 QTahas1ECAYM/4Qx35ZCTiRRdv/PC4F8Pc1roq5W8k4VuE24KPF0/hR/PCw2P/y3Eec5X
	 NNd+uF3//0RWOaM8eUaZYj1N+iESyHazukr0KB0U+h/vMymm6QICbEkZ4KVVLTJ/wHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511377;
	h=Received:Content-Type:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Subject:Content-Language:From:In-Reply-To;
	bh=SqlvCF1yGIK+UQ8D58WOjb31AYKytUb5JzgwuUaqPHQ=;
	b=nzJsNBKVKjVCN6KxJtAEFTi8NO1RtRXGNER5gpQ6lUWq354fBXXl07xQfWueL0J06zBv
	 cgRLNWpnc8hGIrRuILAR1RSF5428i8CyDYxt5MUV8Utr3CMzfyKzX649xfGlzn8CJspun
	 I/hS0sZRic5pXzzmhBTe2ANMj5SBti4d72iRn8+DHNY2x0fO9pofpZUbty+ZSYAQsNE/y
	 GUF1AFc37RreUJqsywrKCF4/NsumfHB4dDGxm7EKh5FFN/aJIooDk3J1v54r/JOhOLeqx
	 a1RS3cMXzL8CJa3nUaqwJuJmVPuiyfTUMvyS6GpJIWAEsKiFPSGIG3wfNqaeoc1r6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD9606A31D
	for <dtrace@lists.linux.dev>; Tue, 20 Oct 2026 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F631F000C4;
	Tue, 20 Oct 2026 15:49:35 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------HmvrAfYQ8jPbSoSOEhpUAwaS"
Message-ID: <8fcbc041-a175-4af9-a13d-c81006b83bba@kernel.org>
Date: Tue, 20 Oct 2026 16:49:03 +0100
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kris.van.hees@oracle.com
Cc: alan.maguire@oracle.com, dtrace-devel@oss.oracle.com,
 dtrace@lists.linux.dev
References: <asPQNnYoMDTJviCl@kvh-deb-bpf>
Subject: Re: [PATCH v5 11/11] test: Add a test for the PCP ManagedDTraceScript
 interface
Content-Language: en-GB
From: Alan Maguire <almagui@kernel.org>
In-Reply-To: <asPQNnYoMDTJviCl@kvh-deb-bpf>

This is a multi-part message in MIME format.
--------------HmvrAfYQ8jPbSoSOEhpUAwaS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> 
> This should either add a dependency on python and pcp for the testsuite,
> or there should be a .x file to exclude this test when python and pcp
> are not available.  As it is now, not having PCP on the system will
> cause the test to fail.

The earlier python tests introduce a test.x for python availability, so
that should cover this test too. There is a test for pcp availability
below, see:

> +if ! "$DTRACE_PYTHON" -c 'import dtrace, cpmapi, cpmda, pcp.pmapi, pcp.pmda' \
> +    >/dev/null 2>&1; then
> +    echo "DTrace or PCP Python bindings are unavailable"
> +    exit 2
> +fi
> +

...but the exit 2 triggers a fail IIRC; something like the attached should
work I think..
--------------HmvrAfYQ8jPbSoSOEhpUAwaS
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-test-Add-a-test-for-the-PCP-ManagedDTraceScript-inte.patch"
Content-Disposition: attachment;
 filename*0="0001-test-Add-a-test-for-the-PCP-ManagedDTraceScript-inte.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzN2I1YmU4NzRlMjA3ZjI0NGU5MmM2NDcyMGZmYmNlMGZlYmFhMmExIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGFuIE1hZ3VpcmUgPGFsYW4ubWFndWlyZUBvcmFj
bGUuY29tPgpEYXRlOiBUdWUsIDE4IEF1ZyAyMDI2IDExOjI4OjUxICswMTAwClN1YmplY3Q6
IFtQQVRDSCAxLzJdIHRlc3Q6IEFkZCBhIHRlc3QgZm9yIHRoZSBQQ1AgTWFuYWdlZERUcmFj
ZVNjcmlwdAogaW50ZXJmYWNlCgpTaW5jZSB0ZXN0cyBjYW5ub3QgcmVseSBvbiBhIGZ1bGwg
UENQIGNvbmZpZ3VyYXRpb24sIGRvCmxpbWl0ZWQgdGVzdGluZyBvZiBhIE1hbmFnZWREVHJh
Y2VTY3JpcHQsIGVuc3VyaW5nIHRoYXQKd2UgY2FuIGNyZWF0ZSBpdCwgc3RhcnQgaXQgYW5k
IHRoYXQgaXQgY29sbGVjdHMgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEFsYW4gTWFndWlyZSA8
YWxhbi5tYWd1aXJlQG9yYWNsZS5jb20+Ci0tLQogdGVzdC91bml0dGVzdC9weXRob24vdHN0
LnBjcC5zaCB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdC91
bml0dGVzdC9weXRob24vdHN0LnBjcC54ICB8IDE2ICsrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCA3OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgdGVzdC91bml0dGVz
dC9weXRob24vdHN0LnBjcC5zaAogY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3QvdW5pdHRlc3Qv
cHl0aG9uL3RzdC5wY3AueAoKZGlmZiAtLWdpdCBhL3Rlc3QvdW5pdHRlc3QvcHl0aG9uL3Rz
dC5wY3Auc2ggYi90ZXN0L3VuaXR0ZXN0L3B5dGhvbi90c3QucGNwLnNoCm5ldyBmaWxlIG1v
ZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwLi5jZDhjMDNiNAotLS0gL2Rldi9udWxsCisrKyBi
L3Rlc3QvdW5pdHRlc3QvcHl0aG9uL3RzdC5wY3Auc2gKQEAgLTAsMCArMSw2MyBAQAorIyEv
YmluL2Jhc2gKKyMKKyMgT3JhY2xlIExpbnV4IERUcmFjZS4KKyMgQ29weXJpZ2h0IChjKSAy
MDI2LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVk
LgorIyBMaWNlbnNlZCB1bmRlciB0aGUgVW5pdmVyc2FsIFBlcm1pc3NpdmUgTGljZW5zZSB2
IDEuMCBhcyBzaG93biBhdAorIyBodHRwOi8vb3NzLm9yYWNsZS5jb20vbGljZW5zZXMvdXBs
LgorIworIyBUZXN0IHRoZSBQQ1AgTWFuYWdlZERUcmFjZVNjcmlwdCB3aXRoIGEgcmVhbCBE
VHJhY2Ugc2Vzc2lvbi4KKyMgQEB0aW1lb3V0OiA2MAorCitpZiBbICQjIC1uZSAxIF07IHRo
ZW4KKyAgICBlY2hvICJ1c2FnZTogJDAgPGR0cmFjZT4iID4mMgorICAgIGV4aXQgMgorZmkK
KwordG1wZGlyPSQobWt0ZW1wIC1kKQorY2xlYW51cCgpIHsgcm0gLXJmICIkdG1wZGlyIjsg
fQordHJhcCBjbGVhbnVwIEVYSVQKKworY2F0ID4iJHRtcGRpci90ZXN0LnB5IiA8PCdFT0Yn
CisjIS91c3IvYmluL2VudiBweXRob24zCitpbXBvcnQgaW1wb3J0bGliLm1hY2hpbmVyeQor
aW1wb3J0IGltcG9ydGxpYi51dGlsCitpbXBvcnQgdGltZQorCitsb2FkZXIgPSBpbXBvcnRs
aWIubWFjaGluZXJ5LlNvdXJjZUZpbGVMb2FkZXIoInBtZGFkdHJhY2UiLCAicGNwL3BtZGFk
dHJhY2UucHl0aG9uIikKK3NwZWMgPSBpbXBvcnRsaWIudXRpbC5zcGVjX2Zyb21fbG9hZGVy
KCJwbWRhZHRyYWNlIiwgbG9hZGVyKQorcG1kYWR0cmFjZSA9IGltcG9ydGxpYi51dGlsLm1v
ZHVsZV9mcm9tX3NwZWMoc3BlYykKK3NwZWMubG9hZGVyLmV4ZWNfbW9kdWxlKHBtZGFkdHJh
Y2UpCisKK2NyZWF0ZWQgPSBbXQorc2NyaXB0ID0gcG1kYWR0cmFjZS5NYW5hZ2VkRFRyYWNl
U2NyaXB0KAorICAgICJ0aWNrX3Rlc3QiLCAicHJvZmlsZTo6OnRpY2stMXMgLyQxID09IDEv
IHsgQHRpY2tzID0gY291bnQoKTsgfSIsIEZhbHNlLAorICAgIHsicXVpZXQiOiBUcnVlfSwg
Ii4iLCBOb25lLCBOb25lLCBbXSwgWyIxIl0sIDAsCisgICAgcHJpbnQsCispCitzY3JpcHQu
X2RhdGFfY2FsbGJhY2tzID0geworICAgICJjcmVhdGVfbWV0cmljIjogbGFtYmRhIGVudHJ5
OiBjcmVhdGVkLmFwcGVuZCgoIm1ldHJpYyIsIGVudHJ5Lm1ldHJpYykpLAorICAgICJjcmVh
dGVfaW5zdGFuY2UiOiBsYW1iZGEgZW50cnk6IGNyZWF0ZWQuYXBwZW5kKAorICAgICAgICAo
Imluc3RhbmNlIiwgZW50cnkubWV0cmljLCBlbnRyeS5pbnN0YW5jZSkKKyAgICApLAorICAg
ICJ1cGRhdGVfaW5zdGFuY2UiOiBsYW1iZGEgZW50cnk6IE5vbmUsCisgICAgInJlbW92ZV9p
bnN0YW5jZSI6IGxhbWJkYSBlbnRyeTogTm9uZSwKKyAgICAicmVmcmVzaF9tZXRyaWNzIjog
bGFtYmRhOiBOb25lLAorfQorCitvaywgZXJyb3IgPSBzY3JpcHQuc3RhcnQoKQoraWYgbm90
IG9rOgorICAgIHJhaXNlIFN5c3RlbUV4aXQoZiJ1bmFibGUgdG8gc3RhcnQgTWFuYWdlZERU
cmFjZVNjcmlwdDoge2Vycm9yfSIpCit0aW1lLnNsZWVwKDE1KQorc2NyaXB0LnN0b3AoKQor
CitlbnRyaWVzID0gc2NyaXB0LmxhdGVzdF9hZ2dyZWdhdGlvbnMoKQoraWYgc2NyaXB0LnN0
YXRlKCkgPT0gImVycm9yIjoKKyAgICByYWlzZSBTeXN0ZW1FeGl0KGYiTWFuYWdlZERUcmFj
ZVNjcmlwdCBmYWlsZWQ6IHtzY3JpcHQubGFzdF9lcnJvcigpfSIpCitpZiBub3QgYW55KGVu
dHJ5Lm1ldHJpYy5lbmRzd2l0aCgiLnRpY2tzIikgZm9yIGVudHJ5IGluIGVudHJpZXMudmFs
dWVzKCkpOgorICAgIHJhaXNlIFN5c3RlbUV4aXQoZiJ0aWNrIGFnZ3JlZ2F0aW9uIHdhcyBu
b3QgcHVibGlzaGVkOiB7ZW50cmllc30iKQoraWYgbm90IGFueShpdGVtWzBdID09ICJpbnN0
YW5jZSIgZm9yIGl0ZW0gaW4gY3JlYXRlZCk6CisgICAgcmFpc2UgU3lzdGVtRXhpdChmInRp
Y2sgbWV0cmljIGluc3RhbmNlIHdhcyBub3QgY3JlYXRlZDoge2NyZWF0ZWR9IikKK0VPRgor
CitjaG1vZCAreCAiJHRtcGRpci90ZXN0LnB5IgordGltZW91dCA2MCAiJERUUkFDRV9QWVRI
T04iICIkdG1wZGlyL3Rlc3QucHkiCmRpZmYgLS1naXQgYS90ZXN0L3VuaXR0ZXN0L3B5dGhv
bi90c3QucGNwLnggYi90ZXN0L3VuaXR0ZXN0L3B5dGhvbi90c3QucGNwLngKbmV3IGZpbGUg
bW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAuLjhhMDU0NDFlCi0tLSAvZGV2L251bGwKKysr
IGIvdGVzdC91bml0dGVzdC9weXRob24vdHN0LnBjcC54CkBAIC0wLDAgKzEsMTYgQEAKKyMh
L2Jpbi9iYXNoCisjCisjIE9yYWNsZSBMaW51eCBEVHJhY2UuCisjIENvcHlyaWdodCAoYykg
MjAyNiwgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KKyMgTGljZW5zZWQgdW5kZXIgdGhlIFVuaXZlcnNhbCBQZXJtaXNzaXZlIExpY2Vuc2Ug
diAxLjAgYXMgc2hvd24gYXQKKyMgaHR0cDovL29zcy5vcmFjbGUuY29tL2xpY2Vuc2VzL3Vw
bC4KKyMKKyMgU2tpcCB0aGUgUENQIHRlc3Qgd2hlbiB0aGUgUENQIFB5dGhvbiBiaW5kaW5n
cyBhcmUgbm90IGluc3RhbGxlZC4KKyMKKworaWYgISAiJERUUkFDRV9QWVRIT04iIC1jICdp
bXBvcnQgY3BtYXBpLCBjcG1kYSwgcGNwLnBtYXBpLCBwY3AucG1kYScgPi9kZXYvbnVsbCAy
PiYxOyB0aGVuCisJZWNobyAiUENQIFB5dGhvbiBiaW5kaW5ncyBhcmUgdW5hdmFpbGFibGUi
CisJZXhpdCAyCitmaQorCitleGl0IDAKLS0gCjIuNTUuMAoK

--------------HmvrAfYQ8jPbSoSOEhpUAwaS--
