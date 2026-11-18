Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044317;
	b=EsXpsjInYzd/ugqahp/4vkYwFFgfL4evJyKFvSZVpmQb0H+qv6sjcxMPiPq++r/8F+sq
	 e1gglZIcCW+XULWSU9NWULhcgAUUPs9guvnmziuIzIpARCGWI11M+6OJoY8zFxVFhKNYZ
	 h7enbVw2lrNo3SXWSIAzpqz3jXu3CJbt6bpmoKJh0xlO5TD5mXCclYyZ7qAr6uXNxzu8i
	 akDol6gQYk8WwEnCFIwCPjE5WgiVuvrqZtV3RlHBJ8WLEc2zpkclFof/fAmBmanQra5c+
	 UPCycw0VRe9K5i2VlMK5YWLoOZ4aqb68Uizvl8yQuxsSgY2llsCex0c39X2XXf7aLxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044317;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YIs1gfNTe7lqe6M5ci4NEwMFTGap5Y9Yihfafu6xvOs=;
	b=nc3h/GmbiBGJtZoBk2ra4gS137VOf2SF6HKJs5BB+3eQE1AdENf+rOg5rlKg8W26M18E
	 B78Q+zNeUsnQNXIZECoroBhaIj1YwcsBBODTC16jcY106CfE7ObRX2mDhwAT6Q7penVdZ
	 GfEfpo+x7xrWIAjRW35W0kUeP56/BalCZgydkQZFFWn7hLXpMji0iMnQ/No48wsyTHiB1
	 CRRpX9NZLyrjrKyefoFeJu7QJBx821H4r1gTO1RuvMbxl3UXZ+jEk7cAAkD9bp9bpKXos
	 DjTvZFsxKXJKq/tm8VleOm8LXC2QM8WjlAngcms49N+/UCqGSw1PnRNZEI29tb3Jz1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaL0WaLI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DC606A330
	for <dtrace@lists.linux.dev>; Wed, 18 Nov 2026 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaL0WaLI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795044317;
	b=h6ypgqDzLvFH9MRNZ31WmF6Yu7ejWxyOVUcYlxNFQFLgBl+KFvbUTIn+ba2W1dtHa0ow
	 bavozijlNPqn0kfE21INYwOd6G0e4mrsj2D1uXro3n5RkZ23jE3xOOLrxxIJIAVn0Woa+
	 xRoCh8GjOikGV+nsWY3ZfhFU77yZS13Jxv7uiIAXGbhpmY/5NeGCc8TGATp5Eo4y2bl22
	 93dsqv21XRNatv6Pq72tgCxGbUrPKYRjukpe10ZFqzWhD4aXBMRg6ShdbvKB/uu3RMusn
	 /sFYrVP8HZ0Rvh9I7ruAvUwCCMQKQMbDTau5szsKAJVL14MIK/fn3R9KqwTgfFy56ZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795044317;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YIs1gfNTe7lqe6M5ci4NEwMFTGap5Y9Yihfafu6xvOs=;
	b=enZxTCLI8rJShZud0oTjDuCJtweocXtMDqEzLGxpqiiuEfMIzBjRTiqqn9nfX4K6OiO0
	 eC9UJW8AzWOW1VSFtuu8roZrg6b4Q5acvp6QLy6GMoZd2LQqlFAE8bG46idjaxKRYpTws
	 5bpVUWdNxL4ayA7ayHs8FG1whI5YsWCx5yA1rWCCovPUi9tNI/TV1gf38zw/mjSre9QIK
	 6RUq7gQDTmL9HSiL67HP2J0DvyYyWyzzOT+uqKBxyPoHfxOeVPHHquwuVH4v7QqmQ7wRY
	 +gOuQW9RKjyFeLCoWD2XxYfT8HZgfBdNsS8FepgbmN2pPIHI2maFfwU3VzjI4lOvKpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66E211F000C4;
	Wed, 18 Nov 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044317;
	bh=YIs1gfNTe7lqe6M5ci4NEwMFTGap5Y9Yihfafu6xvOs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jaL0WaLIKwSfwwzKiST7DRgOI6iJkKkr/sSyAnXgIbqfq3lg/2zdc/OErHcL8/uPt
	 SVRuno+3rg8hKx7NqU8/bQT9kMlOzA5mubWUpWOkdMIUi0gcEqI6ZSm0wqER3LFce+
	 IQN8Ucje+Zffo3U4h3FT/xPt2PcOh0cac8sa8SKPktYm/HhhsN/2V1dZ9u6hoHGyv4
	 gVtqGMDwdfZaK33ioZtuFCkYdDPftuTjCdVhpn1KJ8xFIpq2eGEUv83bg8ZBKABMls
	 cOjHmD7NMLNQ14KgXfXyTf/Goy7Kqz3CjvxzbpMXKjXJmnAC68uAK7wp38P/nSCFme
	 d6lGaIArvuZxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAA194AFFE;
	Wed, 18 Nov 2026 23:25:15 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Subject: [PATCH 0/2] Fix a readlink() typo in Psystem_daemon()
Date: Wed, 18 Nov 2026 23:25:03 +0000
Message-Id: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSDlUkvopx0csPjpdiWjEmh
 He36vJbnLNQQVYUOjQLZby06JQqZNNQOLs0gjVWU2vaTkR69lv282hMz9HhPiXOcPGm6crdHtY
 asYMPO6r9I2PQ9+99PP1dZn9BeH6HtK4fMroavH0AAAA=
X-Change-ID: 20261118-b4-bug008-daemon-readlink-67e33013fbc5
To: dtrace@lists.linux.dev
Cc: Kris Van Hees <kris.van.hees@oracle.com>, 
 Nick Alcock <nix@esperi.org.uk>, Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044315; l=1094;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=QVx+rfvL5K2vWv/q7g97wjpaXyyF8t8/XuIKwtxhIQg=;
 b=ZPwTsbCa7BBJ/n53UWuPLJrpzdvZCAUEKqYyLtZ40shi/lKRB7EKgEbgV4k30hTO3DSlO21EC
 VFpLA0MfATcDfvr9rWKE0InD+wCvRSg9PjFijsHR2yonxchGuBkrLsd
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

Psystem_daemon() tests readlink() == 0, but readlink() returns the
number of bytes stored or -1, so the "regular file outside /var" rule
never applied: every root process without a terminal was a system
daemon wherever systemd doesn't decide.

Patch 1 is the one-character fix.  Patch 2 adds a test that hides
/run/systemd with unshare, so the rule is exercised on systemd hosts
too.  On systems without systemd Patch 1 also turns pid/tst.emptystack,
tst.float, tst.manypids and tst.probemod green.

---
Eslam Almorshdy (2):
      libproc: fix readlink() typo in Psystem_daemon()
      test: add test for system daemons with regular files as streams

 libproc/Pcontrol.c                            |  2 +-
 test/unittest/proc/tst.system-daemon-files.r  |  2 +
 test/unittest/proc/tst.system-daemon-files.sh | 94 +++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)
---
base-commit: 61fea621160ea4b6302874c62a723da105b44883
change-id: 20261118-b4-bug008-daemon-readlink-67e33013fbc5

Best regards,
--  
Eslam Almorshdy <ealmorshdy@d-matrix.ai>


