Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955040;
	b=FQEUrD9hHigp13Yako0W6j035ljVx5QOkMvE3WrQ6M4gfDRdpK2Qco2qtOJ5uDlpasRf
	 dECbQOfNA2tIwTxMRE2I/Sc6bJKY6aoFskwRpvVkRqaQ5NhqPDNz626KnXVVS07m2q3Zi
	 mlPTeyAhVDsk+IN5MuLe5qEXz67xhA7YBzyIwX2rIakRnQxEjfaUI6fRks0/q+0tbFYvA
	 NwJ2+Ay1TLxLr9Yo4XMUOmPHX3g5xfbkGJQRXoMEmEHeGddSRKmWRrUsMkaoFYUh0YLtn
	 DsZCKnVbzA93B0e6FafO0WRWxajhIBoyZwFxrbn7w29Bdug/2MvOjrFsvjHyP29zAog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955040;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=AtdXX3SBatKBHzF0bm/uLHNjZn4dnYp/QNynSHuj/Lk=;
	b=BoRQmfW/bHiXJQtgaz8+llW5yEAoC7pCTieacSk8NTMCO/fLDe1vFYzt/ccqrJWoHsbb
	 n4tY6E9VB1xuiKFFLZbGKKx3R1c9SEF4z8ovT833TpY/lXfQhcaIWHYemxgdEuxoGGAPN
	 1tTGwaaghn/QgAtb8SAPjiftmulg9CJIIc/Nsi5ULPrmrT58LMQ/geOomJ2oqvDIZWFyp
	 PCU0QkklST7pGBme2PXv4vt3mZTE9CQY051QKojrzR2LSQ5klD+tHCHZL8InCmQNTOMpM
	 FzUhFy+4Zjh5HtvPchNDS4EljIbNSrRBqJYxtOruCSTeBdzdU+BXQhUNHZ0iWGM4lxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECh00XI1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93998606A32A
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECh00XI1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955040;
	b=MBnFDiipmTiMAI0zuIMAH+P8kxbbaOINA81fSxtMlRBvENp3n7Y7/r+FH9OTo/mlDIuW
	 Jmb4i2wJb1kkLF5rW/FBpbdcJULUMZqZov2HyUNaCbSGEsKsnoPk4d0oRM63MrAt/oZ/T
	 4DeIqeQb+bb1ImJ8mzA9wYaEZQnYPbKx0DUwIorJuaxBRbH2WcFSsV+xCb01PMfUDg2wi
	 xtOFOG7EVufEQgLEQxSROBDF9JrfyPzgICUtkHuA0yske7tnZ075fXDpDYZ451nDSpUAA
	 j78RMhB8g3mdpKubw6RpAY3A537Iw+WK0WXT4DyeqINSfiHQjcIquc9Euf6K5ZLI/9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955040;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=AtdXX3SBatKBHzF0bm/uLHNjZn4dnYp/QNynSHuj/Lk=;
	b=3fv8cj84IyWXT5NYforao8u41af5gM+7dMUUwabR4OFbW/2hexFcoUzRl/WbMKlyQgL7
	 g4fjfzudMvQ49QIv2VXR981cIVhcPzkCORQILY5Z4Nsbf0QyFahTUytJQjpztKTan58Ww
	 hln+D+NfYaB16AkPddDrmQfi8+BJuVEEO90/R/RrY5HM3I5Pw2DqZWAhuLAcfR/VpO2eY
	 mHLyDAD3/doCaUxy2YzKf9q4J5QFTJH0DFfkdwmWkKIYaLi8WBJiHbq918kcZdXPjOUXL
	 ZQtqg6KcSr3JbHHk+2GcZB0NTjD0F3V4GTF/UUeqLFwT80NibCWYAtPQO/F33gPvqEA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 927251F000C5;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955040;
	bh=AtdXX3SBatKBHzF0bm/uLHNjZn4dnYp/QNynSHuj/Lk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ECh00XI1sVk9Yoay7YslFI6y73WVUXfq5/eeMFQy8ZpEGWvs79MFQzBhJWLT6DICu
	 OTzb8amaIr/sO9PJg3H+m+UFWhdb44eUDfTTE/RWa44bLUxJ9POf1Vii3fN+bjcOEe
	 goKjrLTS5WSEakwvveVZH+Y2JfBkGGpviaozo0p7d8iaEdqHP2EBdPBuy8Grjez2mP
	 NyJ0OHYaHw+oiH5HGdSBcKdMEJ7H44sBlS+mVZ01ntKN91Q1tITS9x+SglW2mO7J0x
	 D2wVGROah+YVWNU4rfDjFkXIHEozNhrVZdNqwBboo7Gd2K/W5ZrDIZlK+XXiKoL5xd
	 MLO/1h7rLkmKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7DF54AB17;
	Tue, 17 Nov 2026 22:37:18 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Subject: [PATCH RFC 0/7] Fix the load bias of objects with a non-zero link
 address
Date: Tue, 17 Nov 2026 22:36:38 +0000
Message-Id: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NzW7DIBCEX8Xi3JVYwGvH10h9gF6rHFhYUqokp
 GBHlaK8e50f9Tijme+7qiY1S1NTd1VVLrnlcloDvnUqfPnTXiDHNSujDSHiAOyAl73WFg7FR+D
 sG9hNYurFJo5Orc9zlZR/H9RP9fG+Vbtn2Rb+ljDfea9ZlZ9ldc6v7b9y6h5Cjf3ThrCca2GBl
 A8CJaUmM4SBXB+FYtSb6YJ3JPsmEMrxmOepI0ziySCSFu+YrDbj4AIZPxgbPeqenRtHq3a32x+
 Sw4wxCQEAAA==
X-Change-ID: 20261117-b4-bug003-load-bias-39fb65e3fbd4
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=4110;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=Pm/L8RdDiVcJkkKxYV7pmW8sToU8PyX1WZDIpNGHqbo=;
 b=stfywovjVI8UUemxpK1SIeaJKN0oQJGoR7zYsSy/QFkXrTir3SDr1c8OKenM11aVF6wOdEyV2
 9YNZ7FSSjumDI093Q0WiCEOw8VgndEyyKq7NU2dxPfHv8tKjc+wZyQb
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

Posted as an RFC after a chat with Kris on IRC (2026-11-17) about the
load-bias calculations, in case it helps as a reference.  It builds on
"Fix probe placement in LLVM lld-linked objects by using file offsets"
[1]; no rush on this one until that series has been looked at.

Several places convert link-time addresses to runtime addresses using
the load address of the object's first mapping as the load bias.  That
is right only for objects linked at 0.  The bias is the first mapping's
start minus the first PT_LOAD's page-aligned p_vaddr (the gABI base
address, ld.so's l_addr): 0 for a non-PIE executable linked at 0x400000,
the mapping's start for a PIE linked at 0, and the difference for
objects linked elsewhere (GNU ld -Ttext-segment, lld --image-base).
With the first mapping's start as the bias, probes in those objects are
not created and their functions are not named.

  1-2  libproc: the fallback bias, used without ld.so's link map,
       subtracts only the low bits of p_vaddr (+ ufunc() test)
  3    libproc: add Paddr_to_load_bias()
  4-5  pid: use it for "-" probe addresses; this also fixes "-" probes
       on every PIE under -p, where MA_PIC is not yet known (+ test)
  6-7  dtprobed: subtract the first PT_LOAD's page-aligned p_vaddr from
       the base it adds to USDT note addresses (+ test)

The tests cover lld objects, hence the dependency on [1].

Tested on devel 61fea621 plus v1 of [1], building after each fix: each
test fails before its fix and passes after, and rejects a bias computed
from the containing mapping.  pid/, usdt/, begin/, end/, noresolve/ and
profile-n/ show no other change.  On dev-queue 0e93872f the tests also
fail without the series and pass with it.

dt_cg_elf_sym_to_offset() in Alan's pending uresolve() series [2] uses
the fallback formula that patch 1 replaces.

[1] https://lore.kernel.org/dtrace/20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai/
[2] https://lore.kernel.org/dtrace/20260605221217.1211791-5-alan.maguire@oracle.com/

---
Eslam Almorshdy (7):
      libproc: fix the fallback load bias for non-zero link addresses
      test: add ufunc() test for libraries with a non-zero link address
      libproc: add Paddr_to_load_bias()
      pid: use the load bias for "-" probe addresses
      test: add pid "-" probe test for -p and non-zero link addresses
      dtprobed: fix the USDT load bias for non-zero link addresses
      test: add USDT test for libraries with a non-zero link address

 dtprobed/dtprobed.c                           | 27 +++++++-
 libdtrace/dt_pid.c                            | 10 ++-
 libproc/Psymtab.c                             | 42 +++++++++++-
 libproc/libproc.h                             |  1 +
 test/unittest/pid/tst.dash-loadbias.r         |  1 +
 test/unittest/pid/tst.dash-loadbias.sh        | 95 ++++++++++++++++++++++++++
 test/unittest/pid/tst.dash-loadbias.x         | 14 ++++
 test/unittest/profile-n/tst.ufunc-loadbias.r  |  1 +
 test/unittest/profile-n/tst.ufunc-loadbias.sh | 85 ++++++++++++++++++++++++
 test/unittest/profile-n/tst.ufunc-loadbias.x  | 14 ++++
 test/unittest/usdt/tst.lib-loadbias.r         |  1 +
 test/unittest/usdt/tst.lib-loadbias.sh        | 96 +++++++++++++++++++++++++++
 test/unittest/usdt/tst.lib-loadbias.x         | 14 ++++
 13 files changed, 394 insertions(+), 7 deletions(-)
---
base-commit: 61fea621160ea4b6302874c62a723da105b44883
change-id: 20261117-b4-bug003-load-bias-39fb65e3fbd4
prerequisite-change-id: 20261015-bug001-uprobe-file-offset-c7645de6dd09:v1
prerequisite-patch-id: d5576cf337dee4c703a6e0ad59c781032fdbf3b7
prerequisite-patch-id: 288621607351e70c6a914b04494bdd2c3921ec62
prerequisite-patch-id: 2dc844beab8edb5e05b3b41b4a227365d62fc6ea
prerequisite-patch-id: b4b63ab534c3ed4380f781570ec65dc2c37e4686
prerequisite-patch-id: f3fe2289eda12cbbe9c5e2b5d5891639774d905f
prerequisite-patch-id: a9ef84a82a3940dfb7810737c4de33471a8e80d3
prerequisite-patch-id: 902233f2e3036f2d77e08e3139fe9d06beff48f9

Best regards,
--  
Eslam Almorshdy <ealmorshdy@d-matrix.ai>


