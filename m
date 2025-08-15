Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204883176E8
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755280215; cv=fail; b=ow9jDnXpYLNOtVa0KHRfluXxl2lwx+t5uetLN503SuvoAUCR1MeqvOweVBCk0MgDNgN53rd3uAUQ/m9G071ViRFmBLp4bv6dRqC9C56KQO42joQNtwKuylGrUoVQgP6VLFDk/OOTRBveyyxoVDi+FBgPojJXHvxYfZgp3/BplFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755280215; c=relaxed/simple;
	bh=Fp+bX/NuE7EVOoHuh5K96WYDbf4GC8rjGMFkz83hojw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nEYbgph4WQ/d/vmQMNyLop0UMoOVl/2s7GfAY96R6ATQVLuDFoYE/5sx67QPanhaJLteMmgg/qw88wLWd/9GW2AemN5orZ2s6R/++7bEjiSChk6og23EnZ6y/oERDa7Z/KigihB0QMZc5f5m6mzFqHA7g+wW51QCXgiOzwqCh/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sStxIas4; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WsuNRInW reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sStxIas4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WsuNRInW"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FHkI5q002340
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IgIHin8YTTLggP0z+Di37D7kN0zbR0DoYGTP7zSP1Ug=; b=
	sStxIas4mVwVI+8YMFvxCiJOJv8a68LCBlviWNMAGKershHZ9ev8votade7mOduV
	ta3LfVfO+Z1+uUPVNuNY5F/9+yBBzDPHWsEX4x+XiKmjQ67YyMJiSsUsKD1db8ts
	MKf/5dSb/y3MxH4QmshsqCLBvHa/yzMbs/hKAR/JxYokCC2kPDWAK/maBWky5twa
	FFmNu5QWqqwYXae+OJ0bkt3dSA5fi47dFcW7BkJO2Wj7s2AE66Mf4WMkPBXUR73e
	eiBGCEeWJ4g0U+1TeHseKUxLYWLcQlkIpEAB+AmAK9QQNenLL5ZZZ9MogCxJmPDY
	S7CPphdBUS2S9udiGHKUVw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvx48s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:50:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FGtFB7030396
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:50:11 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvse7wjc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4jx2R4wHwFQMUmnI/fBytwLprFM+csE8OUpuZ5T2etk9FaWoPqg9HNOP8yIHF39um5X0XDp/r1ourG3tM66aTRKy+TjJLRC4qZ8cyVbFdPqsm6EI7klKNZJQJMGW2gf2mahrzSc6PmLceuO41ylkwmym+vk4MrYJs1wRbf61sPPWtPmkOYLgSSNeNr92v4lWEwHBNl1Ad0NqB2crEmroDCJo5+z28dqCwxKROHlWqkD+r4IdjXlpXUYxGl/2DCCRmiIFBvG0B/MdCsZCBZlFuNbDSOblmdfBlrfkvkHA3sMS+J/mckIMEaEHh5c4hU4/AqaqaHRJdxwgbU9MYvO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky/29X/WRBPfEf0/DcVzmKnn5nqGzFQhS2b0UCuR2qM=;
 b=V0f+m1R0J28zdis11JB3OQ8Tq3rWpn98Mqw0hDH0cd5XE3JMRpPPguqlhlCTLUl5bZh6EZgTH/u5VTX0SnY9FlFGeC+oAqv3WI/Xd51/iLaL+A9jfzBjnyioC9U823YzS2QGNB+z5Y9D8pNPpuTHN26fbV5pUoyyyZirvtSsQQmQ8IpRS5tJU25G3WLoyiRLkvg417PgZ+fn5ktZgvn839UZb6fOW++NkRZzCReQAro43wlSp3vrEQrOToAb4N35QQB6OcV4q1OGC8l6Rrv4d9ssadIqnQAAiMfBFV7ikb0QaKnNG03mQbkMlHCfRo3qU/+92vLMka2Ke2WasK05TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky/29X/WRBPfEf0/DcVzmKnn5nqGzFQhS2b0UCuR2qM=;
 b=WsuNRInWaJJSopi3w5wVKFaalxMsW3z/ixsDGtuswR/4U1jAxv4yXEct/MF3+k4X3FLecymX/oyNjLlJDTYrGL2Bb2mIdI06A9WdPNAe61uzr+mA/Wt1DXOTmNNn1xFAGJ1MH8kqq85vVV3bRXq74zypkvBuLO1jDGh7YXYaR6o=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6995.namprd10.prod.outlook.com (2603:10b6:8:150::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 17:50:08 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 17:50:08 +0000
Date: Fri, 15 Aug 2025 13:50:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Possible uninitialized 'last' variable in
 usdt_copyin_data()
Message-ID: <aJ9zTbHTqH52NeTE@oracle.com>
References: <20250812224606.16606-1-eugene.loh@oracle.com>
 <aJ9ReKhdRvtPBhuC@oracle.com>
 <ec52d25f-c029-3afd-f03b-062f44b1bcb5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec52d25f-c029-3afd-f03b-062f44b1bcb5@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 74831674-5e71-4a5a-39e6-08dddc242ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DJu0sAyLB09fgBEZiMC3TlKP/ql3f2hKNzmWdjepWKtzQ0nV/Oceh9VjLm?=
 =?iso-8859-1?Q?WfjSNYGYnbScsgIyq3EG4pfeoC1Un8ZtxviE9ny2dH4Ov1jDg4AEfotObE?=
 =?iso-8859-1?Q?FLpoh9PDlgUSn65b1tNyO87uLAxAONQnNgzG7A57dLGOC1jUkzX98914UF?=
 =?iso-8859-1?Q?3O8o4B6tFbE9YNYjdzKAtdqiDLb2BVTD4mu3RbX9rTAoPBSF4D6DdXU7Fu?=
 =?iso-8859-1?Q?UPjGCbyAK3sUzY8p0w528kq1m6+QwcNg0CoeuLsUMKXjFLI6QUkzd52t4J?=
 =?iso-8859-1?Q?friL60ANv37F3dLxlStexB1xHDHElTTD4ey9qw7NO3mV2K7CjKPakQcmDQ?=
 =?iso-8859-1?Q?hSJMTG8W9fau96e3JWZgsivkIgiPdsU5hhzbG8K0FFb5rTzUZBMRd4vS6I?=
 =?iso-8859-1?Q?QV7Fjy+LTK6xkjBqKaovF47OhDYY1CF/6KiAXjDee3OCe0FD7nfsDqpTRo?=
 =?iso-8859-1?Q?pS5EzmOv3uApxMa3AeouyMNguomTfPf4JaPX/n1lpqvMlB/oVBlBkGSbej?=
 =?iso-8859-1?Q?jP5YfHNKPstX6nvVYpkfyQxYszv/aGLk8XiAR3hODv0hXVrOaTnQ0IZt0j?=
 =?iso-8859-1?Q?0DuMUScV1efkv3qG1IcIK8mfCUf/ghi/21zpMWRInc7uIOJy2jnjxDY/zR?=
 =?iso-8859-1?Q?R56j8pIIJ9G8C2d1S/FPSTt2oCKebisu1x+U300oTLhUhzUKqgcfZXB8CT?=
 =?iso-8859-1?Q?HOQGyw41WeNAXs5s0PSdxxCcdd+diInid2+OG6ypEVKevKe5j0tqMYtNAH?=
 =?iso-8859-1?Q?3XjoSbmgaiH67BNHL/z1wc/4pL5jcyh2lY6KBLgovO9y8/fIHU1xMX9/+J?=
 =?iso-8859-1?Q?7U5TNutF+AdoWKuLs6mqNm49o5mXB6mKwg/i5BDxU+hqhvavROl5QOSaiu?=
 =?iso-8859-1?Q?yWYsdpNbwMduYAf1pfx7NZMR4xt2vTvy7hBCiKxMd+53LD3eLaHA3TPqAA?=
 =?iso-8859-1?Q?LiK9OpW06bl+QjuJMEpLyBMH9d24XRp60UklwB2+cR0K1/nFzy0Tq6YC4K?=
 =?iso-8859-1?Q?+4ZMkA/Igxrnn2AuUcRIaUfJrO1uO6To+x1tAbgSaA0/u/YHzRWissv6Lh?=
 =?iso-8859-1?Q?e1BfQgzfKK9cxCS0fKJvhj4eiqgb7tNjQ+5OTGHVU1MFHhlyW1fVsgjkfh?=
 =?iso-8859-1?Q?gOGLH7riaohFW0Z6njHuPSCrUZTQCrTqvXiN5smh7pIT4r8n08otVOigY4?=
 =?iso-8859-1?Q?Sa0ZPdfEhAORukd+uK4C49sMIie8/D3JA3vHfBs5hkq0zbJ0/69hf3yxwz?=
 =?iso-8859-1?Q?OXAv9L6BEfK077E91OgPh+sJJJPcwKY/pSDZvLT5pYA+ygMj89SuaTwZuq?=
 =?iso-8859-1?Q?i2pLQEcnLX0YXhKdGqCgx1lyazy8QRUvYMhjwE+A2FwsY5GY6XTVFbKXEr?=
 =?iso-8859-1?Q?JwriFUbO1A1If4+qxgl+9vRMPPJIOalOFd8TAYi/WhXdFmRLuzmefORRsq?=
 =?iso-8859-1?Q?mvUmAEWSgotDIU0CBcAWewGXv6X5qSY8Hw4LJ4hLPEFIpuLbDkypzvTP71?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?MpX11mj7qEHn964jM73YTqw0+9bEkhJON0fXN04RF+doVU2+6TE2KQRLnU?=
 =?iso-8859-1?Q?soKLrA1Khf6gsKO2ht2hjbd4O+dEL9pfbAYmLZhe6mOIU/Wn3XGIDA7CFZ?=
 =?iso-8859-1?Q?kMOs9GDAd7V2sOzqTTvLp3UrTUKZ6Lwgbf2deKl4L9JpW706cAJ6pd/a1X?=
 =?iso-8859-1?Q?URwIEH0zBrQoGgCp17rvZfhEywSsdBFGWXEgpAjF/yIAfIY+47ByNs/5d4?=
 =?iso-8859-1?Q?CajFHIc0esvBmEqADdXXM4im27nGUNBd9ViiP3JvwwwWFO/L4oYa6ZqBUf?=
 =?iso-8859-1?Q?DCHVpTniLtahQKzmi2txwRqc8NohPFGdcmW3f1+gEDcdWxtA+FFbqrgb9e?=
 =?iso-8859-1?Q?IUCXRlp9ZJM3fFshVOtYEpUH/qRctmXUJuKKfUhCMT5lI+aWBmjUKb5i1X?=
 =?iso-8859-1?Q?nirAiLqIQnzNJCM3M6nPwCmgoCz3H697cMUIXY2iCp4v6+ofAdPwHWXII+?=
 =?iso-8859-1?Q?2zJSKaZSJyDePuQ2vVvat5Klux059i/zns1G3OSiF8KSiYfXeJXe+ho4/r?=
 =?iso-8859-1?Q?p3VajnT789Ct5gk1pJ/b7JBKFYH8Zgd/0TC4I3uZBLX3RCItrLiHXKecET?=
 =?iso-8859-1?Q?GJamSFh4tgVOMB826vTv6gVMThs6PDSVslIo0q761VQJuc5hpqcAF9eDiF?=
 =?iso-8859-1?Q?bmoUQyTxmczYz/+Pk7PIUIfbwIPSKqTVDHaRynCeH7takRyK9LE/FRQFy2?=
 =?iso-8859-1?Q?9XtuU3qsDzyZ7Vsv5h8PlRGRDVo1Ju04ki3Fl9Srx+gGj4KdaCAmOFiROg?=
 =?iso-8859-1?Q?5jnrYYzeAq56MC7/L69YRVV+GVQOqQVHDK0p0CUgJZaF3J3p9x305hL/3U?=
 =?iso-8859-1?Q?+om++//GNwZLwfK/YdTYexO11jpHiTMOCjVLx5CgBy5EzcPKrY80bLn6C3?=
 =?iso-8859-1?Q?WVtNjtNUQmGs1V1DFkaezSUMWFiw8UG0Ju81Hq4/Mw4OYTPMSo0qsCKbuR?=
 =?iso-8859-1?Q?5zJ1ecvltnzNp8Hn5TVmwmgaD91Kne6mCe0OjIA+80oDiRlDkEDrvOtash?=
 =?iso-8859-1?Q?FxH6nzKlVel2FpvwXQ4aJsqp1wq5GsW36S2hX/UY3kUh8NIFidCPejE1uW?=
 =?iso-8859-1?Q?TDNZHUJK2AcExGElbOIXS0WrRDb4h6ICFHaf1yFOJ14STHGATgHyD4IckX?=
 =?iso-8859-1?Q?Iaa0fbKfIEAQ4iIzwYpPdg6/056FKNGWjKi1nMuw1ntzdQVjcDDmQ+3qSa?=
 =?iso-8859-1?Q?74bDSFL6KTk0HTRYoDgMv8nIzGRQrk3FBmDn4wdHngKEBnvsWSRqYJ9mgs?=
 =?iso-8859-1?Q?PMKToez+zwlBKi8PRjDV2rUsiBP38lJ3C+huJyTQHzhlUhH4TTVV5z5a6C?=
 =?iso-8859-1?Q?SR1hYaXMm+6ghKE55iQGFj3Tu28bmfIFjBuCXDmzPqwJUnapjMHx8cXJoe?=
 =?iso-8859-1?Q?rT3SetgOG/D3RUIgefhKJfTNC4YCcu3qlmWrc+FGFiHVLY/+qfr3YZMfmq?=
 =?iso-8859-1?Q?U5zsrc1mWUnaf6Iaxqs8DJ04UcNNvWzoE+Ss4JXm1xGAMjROERkq5yrAsj?=
 =?iso-8859-1?Q?7YTF1wr13RSsOHfjgAgIT5O8FYj3JH8tgoaGx5xNtfxEctVrSOiP3QY4Tx?=
 =?iso-8859-1?Q?W6co94SHb1MCDpTZwJbxEcW9nksC+LR89jdZSAW87KjnnzaJcnTbPF//P4?=
 =?iso-8859-1?Q?Tto7x5XQ2aEpXlQbIHnMPaZmj5ZZlrORco3CppANUYJaxbBEoMS6QLhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dxq+suJ7zLPp6mkUYKn5ZTCJRueHNJTO7+c0Ivjmwbww7yg1ZGr6rV9R1120c+EpVgBOxW9RTu7ZBdNw28mUXO8Kq3vZRu8dPGSsCDQQPD5LdHLq6T625HY2wY/ty9eeAEqKY+pUIN0x7Tk8orfZF5VmVACUZhJEWnJq4kkYb2vuG+Ld0ZCT9sY+B5CtU746vWfunc8KqqsK7lZX1qGlHH9NBOlL8yhbVGARAHFbbZfUyIbqjrCm38fa0GVlQjDdD9eCVOHghDB+lIZN5j62ddG70nshFuJ92tMgYwTons88VEJaU3RBsnWWlvnOAKT2w/ftsqcfFQxEyLJ9xvmqmZBqerABnvsAYRufYhL7w6RwAqV0S3RB7Lq/M2dxoZzGFYeiGhhOgRK3UUxhC/ESgR0e+NzJA67Z/qgKLn32OBZtuWyCJ3jQ72ZrPUFYjUHlaD1bKG7ov7gQu1GJg8gkHlLykODdfE0K/nVGiGcMyW6aERAHbhMBxf/XsZyC/xgrPtR2Z9ho2Fh/LzEM5iox05FLOTlCtosw5CcpH5wMQc5zp/7srnT+nNyysePDx+95IgOuFWfdfEhxKTjkQisWKyvvaM7brexIwCfwOE+Sap4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74831674-5e71-4a5a-39e6-08dddc242ca9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 17:50:08.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6ZZRdv8jom0uGsptRclKZV7MQm8FEQkpZjgE2md29A6EpY075bdHetG0LkhorHoEFrvLecr3g6BsQiIdoCZb5OM7H2LJgVg6Hlo+oJ+BMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6995
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508150149
X-Proofpoint-GUID: s-LaHA5upy-BMqAcIzTTuU3n2v6exWvm
X-Proofpoint-ORIG-GUID: s-LaHA5upy-BMqAcIzTTuU3n2v6exWvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDE0OSBTYWx0ZWRfXyg9jh/ITx3cI
 YeMYs8fWZ+ZJtzmo2SR87+UE/UW4LKd93xcpS+LJvz47oRrohWVwm/zaOb/sshZylgzP8FYedmz
 sFWzuX2FtKG8CVTe069Z6Ijzvo2YtpbkeSlHEq0ZzjG4B3B00oErQhOZo50TPAy2mbenyhKUHfh
 Kj4CIayf5IjdChkoCWb7slblRzblcO88pDUxVTXSvUoBQi2vF+Irh0MRu3+JkEdYN/J2NmI1Ru+
 bRHr2abfd0pD3slhJ3N5Otysf4w1/0lVDn0v7nXaqXSsW60bL9mVaAl4MsIqFxpSp6vyLnQesPj
 6j6X893tTKIa6BMw/ESA/1Kw9/uAkc+4eBmqkxvF+B/ZEncGqgxcUS/x1oQCRTDd+6cRgF3hdBP
 o4rMj1rPfo1Z02rwBmZlyX7BDfF2RE7qlfCGVGTLcrUl3linASoyuly+1jafHq/lX6IYcGnD
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689f7354 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HVrjkWHDy8KIytfEf9AA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Fri, Aug 15, 2025 at 01:12:53PM -0400, Eugene Loh wrote:
> On 8/15/25 11:25, Kris Van Hees wrote:
> 
> > On Tue, Aug 12, 2025 at 06:46:05PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Some compilers warn:
> > > 
> > > libcommon/usdt_parser.c: In function ???usdt_copyin_data???:
> > > libcommon/usdt_parser.c:191:15: warning:
> > >     ???last??? may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >      last->next = blk;
> > >      ~~~~~~~~~~~^~~~~
> > > 
> > > Change the "if" check to make it easier for compilers to recognize
> > > that "last" will be initialized (and non-NULL even!).
> > I disagree...  What compiler version reported this as a warning?  The warning
> > shows a limitation of the compiler to see that last can actually never be
> > used uninitialized.
> 
> OL8 with "yum update" then "make".  Looks like
> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-26.0.1)
> Should I be using a different recipe?

8.5.0 is definitely an old compiler.  So that is not entirely unexpected.

> At least in my opinion, the new code with this patch is simply cleaner.

I guess that will always be subjective...  I really prefer the original code,
because it captures IMHO better that last depends on first, i.e. there is no
concept of a last block until there is at least a first block, since last is
the most recently added block (which cannot exist until there has been a
first).  With the new code, while it avoids a warning on an older compiler,
you make the conditional operate on last, which seems counter-intuitive to me
for a construct where you have a 'first block' and 'more recently added block'.

YMMV

> > I don't think we should make changes like these to accomodate compielrs that
> > are less advanced.  We generally expect systems to be updated to the most
> > recent version of packages so that would include the compiler.
> > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libcommon/usdt_parser.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
> > > index 864198098..d8cb9b7ba 100644
> > > --- a/libcommon/usdt_parser.c
> > > +++ b/libcommon/usdt_parser.c
> > > @@ -163,7 +163,7 @@ usdt_destroy_data(usdt_data_t *data)
> > >   usdt_data_t *
> > >   usdt_copyin_data(int in, int out, int *ok)
> > >   {
> > > -	usdt_data_t *first = NULL, *last;
> > > +	usdt_data_t *first = NULL, *last = NULL;
> > >   	size_t cnt;
> > >   	*ok = 1;
> > > @@ -185,7 +185,7 @@ usdt_copyin_data(int in, int out, int *ok)
> > >   		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
> > >   			goto err;
> > > -		if (first == NULL)
> > > +		if (last == NULL)
> > >   			first = last = blk;
> > >   		else {
> > >   			last->next = blk;
> > > -- 
> > > 2.47.3
> > > 
