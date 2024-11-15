Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49F1891AB
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704236; cv=fail; b=emqhVVoJ5UxU42xIg7XzvgyCwwdelw/VsFvvFGet9h4BpLpoWJqf5wYdno/vHZmYNGs2KepHqYDz+pA7afwq7GJ1REO4hWvzyjJADhbvIueP+KrgdZ6q072pWfotGDpqJJhjEI2QpbXp4nTKfuOjwen3WiOpCfJiD6JJ3gYdMCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704236; c=relaxed/simple;
	bh=HcHeFrZzWnQ6YaAcvtDyebT4qdBuhSv3su81gK2rhNE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=mOaqFt4SZIoBqH2WI2sUdSqFUkA7irn7E1OEUzxhxFJ1VXvG5qczPGeokQyexRDYb1QyonqHQhUJ45eRfA4oIPNEiK5eNQjyIkGa9kY6dkwi20Rj3a2Mx7XVH67sDuWHOmV/h0gRK+nnzQ9ne4mm//IuggWSWhmCvgrOK6YS42k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E/dwBt4p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xdSxECE3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E/dwBt4p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xdSxECE3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKMbAX030110
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Ccb3LJ3fs9vUgkppww
	Kv6ZPbfp1kT7WT3tFGJocJoTw=; b=E/dwBt4paQcM8uwwHU2SG/cnZoqlqCy71G
	N//bMnJ6aAcuxiNc4cHYHznUzSqkW773uzpp9L5AA8Q31gglG+iUH7bwLV5SXHNY
	B16D93AZeIZcUPRW1hGPAkPzLalIdAD826kkz+TtdE+6bpBXr82Qu3eD3c4tNfQD
	5R+wHD+s6lE5o5oxiSsefp3hvL8SjKhheGf3dp3JCb+PzBjAYx0rElgzwHCaxVDq
	Lj5DQhDIvpsO8Ypr3UPVDYNizrbHneB8ybcbCkbJiqJXnLB1cfjuxBEY4UOaZ3aZ
	oR5VwSHG8kPlBX4peANb6cTRQykwPY286xupCaZpenIh7xJ9lBVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwv97d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:57:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKlv5x005728
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:57:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6d5mf5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igPd+SEoe4KWY4aJJePzClvyW6PR8ZHl4yX+iWAhjE24Zm9QcPvtiVTmOadD+xV7YXnqQttgvubIHIPl6/ti6YR3x4p7B98U0KQ+bcppZ6iVWCjloxEP1TQWS6AXO5Q9wJN1e1R+EhLvAFJV5WR+E2ja0A1RCQhJ+VrsdlVJOPHC1Rqut3I8NO/3P6g0KDbZZ7Mh0tDk6krL3VxdK4JMg57I7hD79Zfn3zBg3qcWf5sNvcrQX+8D2+pYytf2xCYYiUcNZIocMSRmqBHM/oLP54ftCjL6PoTByxFbG181YPS9eE0ffHSDKw1aJMoMfzCb6QivyQ0INdOy0Mgr0cOGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccb3LJ3fs9vUgkppwwKv6ZPbfp1kT7WT3tFGJocJoTw=;
 b=QPR/Y0e8P1/RcU4YVZYk4bRjly9YYud6dFQdZh7TjzZm/ZLwzIfRXyP/VtnCsDfX0KtrrV2J7x5Z/F7s7vSxenRiiMAjvdpdSOskkTAN0SA78Jw4PbSNgXGgG2fDiny8AeWYN/xVcaYZi57f2wkRAiXVv2WccKZeNGpj6gTsKKSLuvxCE2ZYtOqPWurFWPg9jsLjuE/zfsTfbn0B6Zm5mDxAZgq8eT1xhD6E5S0pJtDngQbH1qldDdERXVsRlaT3VfgOv+q2c776qUG2EePjL310N2uUlrySY7ioTyVSBTtoxxT7yNhA847OZR8fpG0SY4OCvSry4aDvdlPPNOxVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccb3LJ3fs9vUgkppwwKv6ZPbfp1kT7WT3tFGJocJoTw=;
 b=xdSxECE3rbtMJiD4+ZcLuvl4jeygXL/h5zbtG7U0hwZx4Jj/Pix2C6moJ9GjGiQMW7knMt4apJPgQAueKOjwdzir2ih1SPbyiqbt+fwZLHK//3RmrO1zhM4U38VO8m4NDyyqwS0io15kZlI4ThoP/z7T3eIIUdxcgtdpXNr81X4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB7447.namprd10.prod.outlook.com (2603:10b6:208:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 20:57:09 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:57:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 3/4] probe: do not try to reify probes from uncooked
 providers
References: <20241114220108.95647-1-nick.alcock@oracle.com>
	<20241114220108.95647-3-nick.alcock@oracle.com>
	<ZzbT5s0HcpaJU35k@oracle.com>
Emacs: more than just a Lisp interpreter, a text editor as well!
Date: Fri, 15 Nov 2024 20:57:07 +0000
In-Reply-To: <ZzbT5s0HcpaJU35k@oracle.com> (Kris Van Hees's message of "Thu,
	14 Nov 2024 23:53:58 -0500")
Message-ID: <87y11krza4.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7366bd-b4be-4800-b359-08dd05b8124c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zwpu9U+VzIGPDKNJt1VtqvlD8BXLyoRQTFb8ZKPhR2hHesjuA6a7E6MET0hV?=
 =?us-ascii?Q?91QN11MNLDLKFTQg3lZcK85OPNyXmYIf01ChqHPi8zhYk1Axc+kB674IU8Uu?=
 =?us-ascii?Q?SgubROJy/9Y0vuDjMp11oxDRDFgl6XnffyrBmoqNDq9EcPoEhaIV9KTNekx1?=
 =?us-ascii?Q?6JwXtJ8L2LQIXkxSNCHqLez/vmpyi8MlWxTmsNTTnBLFmHO1sNc/6jZImi8y?=
 =?us-ascii?Q?pY1icda5LTfyWusPguWZfH9zltYjN+542geKhdyzWvGwmrouaTxRcmtY0eWK?=
 =?us-ascii?Q?XzPNVuSFs/opi7laEiIV3xMazfkmh3adKVlOZsbdUPR4NsdiyhFPixzOoqUG?=
 =?us-ascii?Q?cLUBT3bgKxSiWSTdlxIHl2MihPkt16XvmiajRVCsrUVMlu7iG1AY29GSI+VO?=
 =?us-ascii?Q?0IbTGQ6WDbqgunKINcGDsHBL8SFrgItwHMO60hDPPcxvZ9khrRkLYroONvQe?=
 =?us-ascii?Q?QmIqiDkPP8oyR8jWeLBf0SrOqqHlVpOIlfGuUNs4wgrogt3ds3abccfHVDRo?=
 =?us-ascii?Q?2N6h0D8Xklhk4nAbDV1MtAOJV/HqIQkxSqmlZMm5fT8MzItBsZyfwgKHKO6d?=
 =?us-ascii?Q?Y6P+rCl10u14uIf849qRdPaR5WFhQJNkIWBHaMEwP/pppNi25D1CVT+hXQ48?=
 =?us-ascii?Q?dp/OzxAayhSzVc+gH6cBCyIKK4ONXbnuCjlMe1nxYMwu/EIGObYJNNm//jBD?=
 =?us-ascii?Q?zHADlpOjDlihxOn2m0xU5y8lMKGnkNFmT+55rL5BONF0bpJmIP7krAg/CUWF?=
 =?us-ascii?Q?ufQM22ROsl7D2n3GdxYeL70f+V0AM7+Jn1oyQMLEldZ6+MZ8+lhuMrKHR8Ds?=
 =?us-ascii?Q?ebZ7C1jYAPOf59fi9SIkgfSTBZ1bEPqOpqo0fOeeVbLl65Oj1E1ePDDRjaLN?=
 =?us-ascii?Q?oPCmKAq3QOXs4yB9N7mcKTmbP7r5qHvAesCeNOgb6epm3iI4HWHs5ncaaKVb?=
 =?us-ascii?Q?4eJdua42Qkef3bIIIVoHsTl1m+D4vvoZihpBFduu6d4qpnZlqa3S0uQBx6aa?=
 =?us-ascii?Q?8KMGhrjAIO7GAv4Ocrmou6u16RNL7vf2TTAFhbLanxcd14RsLLD9wPwXGORU?=
 =?us-ascii?Q?Xad1tnSoPhmpUOGvYWCuliilgauaTFWVNviGq6Wvi+PHE9Q4RcPqQ0A9TvVy?=
 =?us-ascii?Q?Scoy/lJ2Cv2EqRwfq5viXhOEt9K6TrPiLKnc+18530L/6GFIWwvFknPXZclO?=
 =?us-ascii?Q?H2GzPxiUWIAxWngzmMcpcBNHIWpDBYJlUA3YH+WmWXUSC5/oF1li1wvrpcXA?=
 =?us-ascii?Q?PO2MyOW/xfTemG6HzGSvARdJ67gYItcl8yoJxPGqIG9A4wJNczkRDtVrBlVb?=
 =?us-ascii?Q?RrwBMhlQaL1YHXgr9cEgB+4D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBqYk4WfGfuW0RFhzhAMQEVwWPkqwczTR0nv8Vmyw5DTRlI8zTz+juj8g9XI?=
 =?us-ascii?Q?cK+hFvOYnepLSpVzslOE2kA02FrGg3Ks0Qk/+EHmUnyJoOwwGubNFcNOuenW?=
 =?us-ascii?Q?C07nOeJIoimeXhBYrplOodAbA3zgZ+0S9acAuyN8SBhmgIUnZMlgFBc1YeTH?=
 =?us-ascii?Q?+a475KJkhn58YgNiOfN5zkQaJC0+vD0Hj3oq3FXdy2CAlZ8CBJhl4P8aDroQ?=
 =?us-ascii?Q?BcKj4P5gMQCyTyjn+Nef87UybYvZLvSMydMnwhXrAKHa629Kz2P5nRHpAoOO?=
 =?us-ascii?Q?I3+r+XKcwiQZZ7k9+597/dUtsWJtUZtMW5Zetb3i9p1kbc2XOA6bpwdhtcZ+?=
 =?us-ascii?Q?CwvmO96ljwEJGkOUzhzBKlqvV6jYv7d/HeNigyKt274eOKFV/YrcYM8fhLew?=
 =?us-ascii?Q?7B3iXGAk8itJ3d3e+FyZFFWdx5UC/5NkufqfhzdM+CHf4Q60/G5G23+PTgEO?=
 =?us-ascii?Q?j7KcH+GQ6aIzxP9YQQD3AA5AOPFDsh3sOQe2/ePsUjtv/GXmRlVFjyTTr9ak?=
 =?us-ascii?Q?OxmwyubPoaRZKojuSZfgLzs+N1/VACEsDZJ6ZSWjCTYBq7CNWNirhlNrl9mU?=
 =?us-ascii?Q?vr1nQPXAd7mfYv7YoDC/77wqcPXQM0OQykhsyLo1ntPkEUhwM0BAkvN0xoBG?=
 =?us-ascii?Q?+XDkDkPe9Elv+tmL9BQu+Vw6E0zmvBZVrC5DB1xPJTu72xsqCNqjj1u/q8Nz?=
 =?us-ascii?Q?Jd3oi6OBvOkypulkSvlT8qc1H1ogtceKlhXY52c9GIYY1i1k18qRaXQz0rvN?=
 =?us-ascii?Q?soyuSFSXRLvbsER84smjJq9WGL0cXNEjoU+DU5w+BvIJoQ4KDJWY2OUNV3Lp?=
 =?us-ascii?Q?P0bVkRSmzjwfY/1HjA9PQZzmpMwbqM74qPvAUcOktdhK9TLIcU6/FYXLar15?=
 =?us-ascii?Q?169f1+cO0jbnoqcyLmC9S+8Iv2q4ZKYzmtSGNHzHHNItF6/otVt2Cqy9Ptdd?=
 =?us-ascii?Q?S4itLuQIwMCAVVj9j1OIYI6iogmIowoN/MCSnXa0j/yBnQfKX1I9tor3fbA8?=
 =?us-ascii?Q?U6qiIC6VfLZd2hY0kodXc0988/jZ8gImbbPHWixbbcoMSvrUobJd/H0T15UK?=
 =?us-ascii?Q?k3S8eO8i8iQsx9KgDiyozAmT5FB3cxC80EGBBdiP7BxXU2tpYwh944N3nc+O?=
 =?us-ascii?Q?8AIg/eJ9uNdQJpbTK0JvSg7HW9rKv/907yLVCCVkKY2oJBSidiHEZzSAsiH0?=
 =?us-ascii?Q?5IOt95lh1+Pxw5VCIxnkAMDlEoVFLYxlyWpuuF4SrFn1Cm/2++yfCu3ZYnAF?=
 =?us-ascii?Q?aPBMQKAjfpAFkTV4lcNs8to8AKTSMMeqJf4a5nStpwDY6+xs/THdqGx87KTX?=
 =?us-ascii?Q?Yk3t95QhcZyJG6aAb9vN/BZ7Uh7zyp6l2UQ1lgBy/cXpuTi2G86JZgGXqab7?=
 =?us-ascii?Q?sA3C7zV2KfuKkmItarTwuWnWTKg1GwI2IIA5R+TtLk1T7Jpzs3wyUBWvFHK3?=
 =?us-ascii?Q?CiOHBmOIqhl7ab6yM41O5eYYh5T+yB0XbbBj4vXxMsQb9nIL8RR6OgE09h5k?=
 =?us-ascii?Q?LogfZBt49FHWV1RLS7bjXs20irNFUpZ2O1ABDr3abzGuYy5EoiU+sT41StuQ?=
 =?us-ascii?Q?JyR1DVwjT/zSSI9iL2bOVm5r/oYTXsg7ogpxdOi0dafa61qci8SOkqItHEKJ?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mNwrIDCytC/bXTlQnkJ7CSH2syutPdBzLE+rpkgc55wOjaYEMV6clDgyCr4/nXv7HLGIehJVflENtVu0U/PYHKvGmY8XyGdrl5XW5O8zL++Fm+9ZMOCtxdR2JlVDDP6I2gT0XYdoQ1vOWyoWpPc8ELcsPYLH4h5ueYdt//UjJZMeJA20Grh96AKi7CAXmVkrvU9aeA0RI+rmtYFnPiLrKiUkQQ47h542Tqsg6XvgiFFo+1YLqOuWdxNCTx5Kvw30KKAZm5RkR1x/lTeHtFzjl6HWzFCWMrBHk71rZvroVIACxWUlpkZVoEnUUuLrhiUVBy2ulHuOOenhydkaqx7cAWGg1YPEBpxF7TFF8+zqBl0hkkSDdVzbhfkpuCh/lVcMTTWqS25xaXdyUguldfcVQjw3mTDfWDUS8GT+byX69aXGZpb0TIhgCo8VgoxjuP52+tEKDGW1DhfdKolyqSgqh6V2n6Bg/RubyCwL0aEVDwlKAOm5t3c3wNwJfA5d98aAOxA/Nzf8qopTg8mTkFGcEbPFBe/Kag95jwqswTfO1ZaaMtaI1maq7+Bp1aXpjw8PfWBQeiMwei3YbXVIpYoA8pdwXfHTSyI87Rx+HhPu1fI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7366bd-b4be-4800-b359-08dd05b8124c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:57:09.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Go/7b3gMOFhZHWq5y7PWDsWS3tqk2VQt6vRpZsNwdZ20Kf+mRGmhrwLckdR3cj6Znh64Rhwhctll6ZcJIK2Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_08,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=946 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150175
X-Proofpoint-GUID: KcekmBn7EenD_yt4afJWt9uJbrUtwOdj
X-Proofpoint-ORIG-GUID: KcekmBn7EenD_yt4afJWt9uJbrUtwOdj

On 15 Nov 2024, Kris Van Hees outgrape:

> On Thu, Nov 14, 2024 at 10:01:07PM +0000, Nick Alcock wrote:
>> If there is a syntax error in the middle of a .d script processed
>> by -h, we will be left with a provider in question in an uncooked
>> state (where dt_provider_create() has been called on it with a NULL
>> provider by dt_node_provider(), but it has not had its provider
>> set yet by dt_cook_provider()).
>> 
>> In this case, the attempt to pop the parser stack on error will
>> fail because probe iteration is attempting to reify probes out
>> of providers without making sure they're cooked first:
>> 
>>     at libdtrace/dt_probe.c:1006
>>     argv=0x535830, fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:789
>>     fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:1419
>>     at libdtrace/dt_cc.c:1441
>> 
>> The fix is simple: treat providers with no provimpl just like we do
>> providers with no provide() method in their provimpl: they cannot provide
>> probes, so don't try. (Test coming in a later commit in this series.)
>
> This entire commit message (and the one-liner subject) are actually not
> quite correct in terms of what the problem is.  It has nothing to do with
> cooked vs uncooked providers or probes.  The problem is simply that the
> dt_probe_iter() functions calls the provide() hook in provider prior to
> trying to match probe descriptions, and that cannot be done for a provider
> without implementation.  That is all.

Yes, but I was trying to say *why* that might happen.

> This also needs a test.

It's got one -- the parser-error test I posted in this series died in
two different ways if either of these bugs were present.

> I'm posting an alternative patch (with my reviewed-by) with updated commit
> message and 2 tests (signed-off-by for both of us since you wrote the code).

OK! Looking...

-- 
NULL && (void)
