Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E219DF7A
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508074; cv=fail; b=Mt4DVR/kd1hheGCSAfL4UzS94eBC2y0Uu6oHOmQwP1qsAJ2Rga9hBxBFS00QxuhKA7am/jWWYDsHW9SraV/WPwXAeTuyfue93mNgJRO4mnPs+HjtCL9DYSzl3R6Iz4ES3lofHYbN2nawWL1YuVMiW6qfKUWbrdnLiFvZbPvZPXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508074; c=relaxed/simple;
	bh=ukNj3pBDaLZtZ1EXxkc7QPELS3xVZwzXRLiEW+BEdXY=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=akSea1XE+r4vcwSd7BOMjUt7oJYXbL/kyQN4L3HfeK2I0bLNHqD/QH266YZfP6GiCRvP4GOvzYvKkJ53lFn1/LRfSWl1T6y/qeDO+O+4uSmotx25K5ZsG5HRF2yKH0/DoAuRhiUvaB+tLXbLzJayi37MMWtxI2jq98X0gcKoJAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oZZqu09v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N+p+Xq/b; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oZZqu09v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N+p+Xq/b"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIRXXG026490
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=7aqVHNH1d6HzzBJfbP
	csTlRIBB+9RDNh4poOyFPXxtQ=; b=oZZqu09vC8dly38pVu2Qz/bRaNP4pfEbTZ
	DZpkfxw7a7+9I06Bx3wf/DoNzb0JWY+amGL0/t5lbX371J63ltREzeiqi3JN9w8B
	h8jUORKvfYH1ymg1nZvVMwPFc+dq4cDppo7N9v1Ej2LxV2CHjCNOfx1ltb8TcbGm
	l2wdfbFfVdydw+B4qB3gfLiIB4wfpsIxjBzgERK+DkJSR88/I8thxMWrewCnwJ1J
	wANXE/EjFK5LOEcba2M2kS3yufw3ZXC17dJ58n77YlcM2ElA3ycSNDvLF8r31MnL
	ogE15rfNdh2caVVFywa9LA+khqrE2xE7oujXdBfJXZmpPTW5yP5w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5c2e206-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:27:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PHpP2B002882
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:27:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y519v6mg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVgkhuWBcPuJVuhrh58a+9eeLqQO34I6++0lE0UjX1lE8xAWerhHAfwM6sZkyhV6ilLdoWL9fpFScTRpqqh+iTTqkPQfgXfq2GFDuUxncOtrgtOudOkrpMISvumDfwKPniH4AjgvLz2GibLggPlfDPryQ7u1N6Ak/iIRSgTsZbWXX9TtWcMbAmRhHebM5xqtvB11vv8NO7oXplBGA5RMl+PFY2yO+FQANmOiARlpq1gefi/50bjXjQ3IQoPTUBY9Pk2rOgRTsG0drO+P3GS1XdmY+CVNIddZYVvoaDm0LJYEQcosS91oTxGarUOePhxpPgl5J3LBHMxR6JJ5av04qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aqVHNH1d6HzzBJfbPcsTlRIBB+9RDNh4poOyFPXxtQ=;
 b=DDt9wWRP16wgcB5uiNxv59qTCqZ1rK3CJi39Pup8ihbifIJI3e8GBEPIk8hh2XP/X2mDTSvTRRsETgvy5ZFrARz3yaGzTVirD7LoROXwhREVh4bilOnSRhj1TniKR+WSTcYTLsRkGrzX9Q5Z7DUNibVa0+SAk171o+j1yXcr/VRZwy/qHKZo2qvZtJ3y6mpHjIGpDWQXNp8R63ls7fq/O6YswGe6621pKFFo6CxM7hVP/ymaUQR10+09ViFz4TvwLvkvHWhl8b+OC4O9ui0vqcBWcUcz921V/1Cy8eHJK3is3hqsXDUh1szRnNi+A6yETSu9xCToPE5KPzxpXzoerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aqVHNH1d6HzzBJfbPcsTlRIBB+9RDNh4poOyFPXxtQ=;
 b=N+p+Xq/byCUccp1aKOp6YIJeCfmuKlfmSmB/vSNoXqj8KKtdwxajh11iL4f8p4/SwxQGWYAp0CHbPs+iwU3/JOZBhCyu0cEOxrkjjE34FmUj8e63I0hgkIWIsCh7vQSeAXOgHae0xVmGMGCVGANCqhIh/UEE5nWbv0hARQAkTCQ=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA0PR10MB7181.namprd10.prod.outlook.com (2603:10b6:208:400::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 18:27:47 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 18:27:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: DTrace development list <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev
Subject: USDT blocking ioctl
References: <87r03mt010.fsf@esperi.org.uk>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Tue, 25 Feb 2025 18:27:41 +0000
In-Reply-To: <87r03mt010.fsf@esperi.org.uk> (Nick Alcock's message of "Tue, 25
	Feb 2025 17:19:23 +0000")
Message-ID: <87tt8hswv6.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0375.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::27) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA0PR10MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 4729aef3-fde9-4b06-9823-08dd55ca1aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nFXmMF4iNwarZc+avc63ECUIUoCK0SPPu0YohIGz4H8YhN7QYjkigOfYAtKU?=
 =?us-ascii?Q?hV8xPvJg8PLQ1bpSQnsOQcUjksmK7qSiDHNrg1oxrl4GIUUBPwlrGTynRZjJ?=
 =?us-ascii?Q?yHjS4998fp3YrE97K9S1OueRhOId0l2KD1b3gsTQFvg7xLqC3R55Thh9xKzH?=
 =?us-ascii?Q?IH713wV3qEjCun1aXzbtsC4+0E6kNQyuBJoV4JVAW3pCmPmp/zS0hKPn9hnQ?=
 =?us-ascii?Q?YtfTyaQgo7PBEYR/ga/hMVRbOem7Q11YICqdeEGdDkCjSLP89lRjbZtc7yko?=
 =?us-ascii?Q?kJ4O8iGSefnwz8a5je6wH2GCMHUvKc89N9W3+ewHTd39kFWqMHr18i9QVfsL?=
 =?us-ascii?Q?0dMpipxv1QlIDYwZS3NjKy1+zO1sF/GaxYnbyYhg2E9t2nF19e2uyXZYNRIs?=
 =?us-ascii?Q?7id2naTzj0I/A9lnR7QNHI7SCMjnkpFDQcqY16KeIb9tsuBAnaHobmwVw+c6?=
 =?us-ascii?Q?N+DUWvOnMBi2rBlTu9UgGy/Ro63arc3V2v6iUNC/R2BlpNXUmjwQlO0Fd/E5?=
 =?us-ascii?Q?sD7G1XzFcrLioXrTGavIPVSTocnqcgwk+DvahqWs5qeV2jIGVFpJ9gGbreXF?=
 =?us-ascii?Q?IMJmTSKj3XKQiJbBxQeug9b8G0Ts/v6mLQbTv9GIdIz41uR46Sq6DwJ0LBEU?=
 =?us-ascii?Q?476X740U2eJJV2hqj7OrbAr7MPPx3K4Kqz/a9OP407k1X9bBo+OooalRh3ya?=
 =?us-ascii?Q?dvEvXQK4M5TzO70id3fGL4suRWy/TEjKh7vZ0KZf/JTMS14BhtF3tOSnIamj?=
 =?us-ascii?Q?aSpXZ4lNVMxTHt4T4TQS2rVLVbTzth9i11TbNB3QvCSrsq0cFd5rf6cgqHYh?=
 =?us-ascii?Q?5vHmq7889xNcgGYbHPi1DAsKdGv0BOKvH6Go1BRUWZqYkfSYsZfPD58HMl8t?=
 =?us-ascii?Q?TjHlf5Igw/dtJEbRu3KtJCP9Q9DDz0Fl/MHiemCtDdicnFqLMhnI8jDMAcKg?=
 =?us-ascii?Q?c/jczw0TLFsQHOAQhUScnqf8zcBq7JvNe4wKbAQVGN+AXRY1YA8KQUinHa6T?=
 =?us-ascii?Q?8b5o1C2wLvTH35dVRCBzain1P2RfAs28fjovoHyK/lL7r4aYGIUTC4G12yRv?=
 =?us-ascii?Q?p9Qk7GgEQOie3IRp4BpuTk7tloUSbdf0aXzlvD1+wcnyx1uBx3JiKaYsW44g?=
 =?us-ascii?Q?tNvPxSSjkG3RqDO97aGK2TAjyChW7zbp5AX2sDfYHvV1THA3I9aN6SVfJM2b?=
 =?us-ascii?Q?KbEvma0DdA8+8Iw7t9ANkgdh6p4PnW9pv0f9hNdanwKowB4QhyhGLjbXvNPU?=
 =?us-ascii?Q?s6o7CuA2Nn+3QLF1AAnwC8v1oPEjTnzoLBMvpHd1yYUbyhHbvojmGoG1EJu/?=
 =?us-ascii?Q?OR3+6WtHVmCjy97AmVbMUxur3MkKQrBz8HCND4Nl4fSFrOKUxgww16nBC83d?=
 =?us-ascii?Q?qL+MJl5x/5ij7R7zEvgH4+RidFM6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WWGG6PCpOF6yaR4RJLzajaFoKj2F1v1LVtmZSre8Yo1O5DJN8dQuBTMjOIDV?=
 =?us-ascii?Q?7MWGFpd0TCl5/+rsxza758ZdutABiT+0QXmEXhvpos+TDvh9iVhfCVAzzMf8?=
 =?us-ascii?Q?m13PMfBPkblWSxyA5ChXYFDizZkmwXAj9wmjimxULTGDb2T+NrUkjqSGdqzw?=
 =?us-ascii?Q?JyUIci3e6Blhg9CkUBOKA3iBWKeHyF9fXVvvCNKXsW/edzX5+rkYTjykmMWY?=
 =?us-ascii?Q?iMNYQTOCseMcBCWrd+CfPEJI7RX8BW4im7fajyk9f7fByEbcT8qjChWy0ekX?=
 =?us-ascii?Q?33tfonPwkGPqFXe6vfcIHUSg4IMl8gEbZpV60u0blZ30svHt9+OD2Arekbhg?=
 =?us-ascii?Q?xgFyK2ap0nJU2atnms00rTfFLLJVI0Vm1BrGUNHLElNHz3BzNnyUJ+S1ouTq?=
 =?us-ascii?Q?5r1eqQS/zVRSwDCCmbs9VjdVX5SYAQvYDsk5KO4aDi+QhFA30OJ8WMN+q3o1?=
 =?us-ascii?Q?t7yoPXl3VDS3Sglt4ldZKUg7NaDdhYZJ391jcTvvSSNqJTC9zb2ccIanjHqv?=
 =?us-ascii?Q?yUN4w07xiUHqbXGW1Ph9+9CA4tduNU7CbNQGggXcX/WqkCx1+4M+e1AIW+sd?=
 =?us-ascii?Q?lVBDtdSGhfYRBRTmwsiMEpSQf9k78sZUcQHrcUrWmIudzs+8EkLd+wF/4njX?=
 =?us-ascii?Q?xWrYhcAS0LgLTLceoqT4wGz0F6C2y/OuT5OxGsYbM4sUewBi47a8N1mJ4WdO?=
 =?us-ascii?Q?9YL/9YSt+p5sGWsJfbjAVsQDy+LUnuzdnIAVV6fdkfO02kP7z8U0l1nZQ5Tv?=
 =?us-ascii?Q?09OLCoHZgfbu+mYi4oADEMf6/Nwp+gEGWeP5MfSLtscC8rr1XSnpjy/66kI8?=
 =?us-ascii?Q?20L3N+46P0efE07mQ/lWIWZMnfBdNkWA47HQMzM9+5nRcr5bCYcxzyXETTt/?=
 =?us-ascii?Q?hNqgeicoA2/EuyQU27x2/rj2noJZq/Sb/BROiZ4NjXAXTtBbsDfJ8iO7R8Of?=
 =?us-ascii?Q?MklgV9e57jpWyTOWqnXrfcuyIbZhuRIU8w83n/7w2w/Hju7MazpH3gGoHGMj?=
 =?us-ascii?Q?E6Qk+HFJ3jKeRaVMxNsXejBxEvXidpnLM45cusk296IYOUSApUprEhRg55sa?=
 =?us-ascii?Q?5A3/LUiuA+lCGDjfAzBM6S18evSzFm0fJ7Rr0JvMeqG0NeRh9vrKO2XVBeeC?=
 =?us-ascii?Q?AwUZRhqEN6fF8lwAXHeLZWxtSW/dsaiAllwhxLDV7lrBR9NpgjM9fYc21HHc?=
 =?us-ascii?Q?Fu7nLJ588DTEnjkQIEmoGiA747wOQwyfX6zvT/USQoSWIUI0EXb02U+3MyE7?=
 =?us-ascii?Q?yOUHFDiW5H/hE+Q2eP2S7hFN18WW3bockjTKFIPoGVopAAzFzCQqj5EBbOXg?=
 =?us-ascii?Q?zsH/wEnIN0f3Su3/UFxYrMyPdg34e0eNOMEK0XLnUqS5yT+s1dPJ8t+EiTcs?=
 =?us-ascii?Q?UFmArNlGuKGj71iDZKD4bohg4+MO7qBofvr1lI1W5NW2272g0BQunbGaGNKv?=
 =?us-ascii?Q?bhtusPLG8XsFByv3r7+qxQq/w/e3iYwulqs/k1grmNMzlGcpsmcfZ/gjTNtD?=
 =?us-ascii?Q?PB2UVC4sI7minZTXK7Z3W9ePauRGB8FYu4hwA10uOETHdaYOpABp/zsiL/ni?=
 =?us-ascii?Q?/fROCv/SPH+9oMR2gQD0pqUEcxjH31Wk+eHxU5nLn6bpj5ovtWFyXo4DaQOl?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kczkRTVx/84ysYBUxLNWYBkxk9HLJdUcEvsZorsuA9n0Na4JmaHHnqvUERa3BiswwL1kMGByQxC9Q2AH5g028t/AKmh03pES/DN3CXwIGDLJlUQRSMLSW0tPGYrGA+zbqH0g81G2cQ1Ok4hGD3i6jVlkD26uMazXM0qMO1n+qJgVKgGeYbKYQ3Dkg5RfqplngKCrhvOFt359ruAb0NDBx7HTVlB1f3XuqyW8g8A8gOfcrg+TSAq5pTh1StEF1fsto/bREpHzoGnawB2fk6IRHkswiOZwT06S/tKh7nHBvI4wwGVme9iC0Iel/eB13XjcdK5EUBe9PHBGmXuNDLa8CA5fAoF0P7Iz5MFpt0HOtmI2pF4JexsTv4iHBgweMujttCDVZaxjPR9fgencKRdcrku8IJmwAI3q37ocCUo5phDjUSSxUEQgTAr57/1kPK/iiIGWrBsz+XrjwxprGKUhHUlEdxex5hSJbKk0d9/FRN+440o6I/XnKLzvExtrCLkvdADZmGbTtAOJmj94y9wnSr22M3Z3T5e45yujzZcOyiJwsqSx/Ztr+hAZxwVeaLGdAQ/M709I2HS39My4A0UzrG1ZavIk7gxUeOF4Ciz/XU4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4729aef3-fde9-4b06-9823-08dd55ca1aa0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 18:27:47.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhQ+2v0eAIKNJjBRZ/D1dmz5KgACgzr4CE0KoFkELnXxJfjsw2Zgk+14UrvPWUorqRKhmnmQamCQXzeL0KCUrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250116
X-Proofpoint-ORIG-GUID: sgxJ9rSZftbELbIZovO8TJjmWsi1vxLP
X-Proofpoint-GUID: sgxJ9rSZftbELbIZovO8TJjmWsi1vxLP

Another attempt at coming up with a design that lets ioctl()s from USDT
processes block until DTrace is ready to handle their probes. All
previous ones have been nightmarishly complex: this one is much simpler
and needs nothing more difficult to implement than plain old named pipes.

The constraints we're trying to satisfy here:

 - any dtraces running when a program containing relevant probes starts
   get a chance to enable those probes before the affected program
   continues execution

 - if the dtrace doesn't reply one way or the other, we give up and let
   it keep going, so a ctrl-z'ed dtrace won't hang arbitrary other
   programs

Here's one possibility!

DTrace, at startup, touches /run/dtrace/pids/$pid: at clean shutdown, it
deletes it again.

When an ioctl comes in, after the DOF stash is updated (so, right before
final, unblocking fuse_reply_ioctl() in dtprobed's helper_ioctl()),
dtprobed runs over all files in /run/dtrace/pids/$pid and does a
kill($pid, 0) on each, deleting any that relate to no-longer-existing
dtraces. If any still exist, dtprobed forks off a new "wait thread" to
handle it, and does *not* immediately reply to the ioctl, but just
returns so another ioctl can come in from something else.

This new thread waits by reading a named pipe,
/run/dtrace/responses/$pid, where $pid is the pid of the DOF-containing
process. When dtraces spot the arrival of the process via inotify and
have registered all probes -- or if they decide they don't care about
this process -- they write their own PIDs down the relevant pipe: the
PIDs, being shorter than PIPE_BUF, are atomically write()/read() so we
don't need to worry about stream semantics and we can pretend the pipe
is message-based :)

The dtprobed ioctl-blocking thread reads these pids, and when all of
them have been received, it replies to the ioctl, unblocking it, and
terminates (for efficiency, we might in future turn this into a thread
pool, but for now, forget it, they're only shortlived and they only
exist for processes with DOF in them when dtraces are running anyway).

This leaves only one problem: races where some dtrace dies, or is
terminated, or suspended after an ioctl comes in and dtprobed starts
waiting for it.

The easiest solution there is for dtprobed to simply remember the time
when it fires off each wait thread and the corresponding DOF-containing
PID in a simple list (so, naturally sorted by thread start time): when a
new ioctl comes in, it runs over the first entry in the list, and if
it's "too old" (#define? startup option?), writes a 0 down that named
pipe and removes the list entry: it keeps doing that until it hits an
entry that isn't "too old", then gets on with normal ioctl processing.
The wait threads respond to a zero coming down the pipe as an immediate
request to unblock the ioctl and terminate, just as if all the dtraces
have responded.


Unanswered questions: only one. I don't know how CUSE and multiple
threads interact. It's possible that we cannot return from the ioctl
function and *not* reply and still expect further ioctls()s from other
processes to turn up, and then later issue a reply to the first ioctl()
from another thread later on. Let's hope we can first, since it makes
things much simpler: I don't see anything in the cuse code preventing it
at first glance. (Of course, there is no documentation whatsoever, but
then what's new.)


Last bit: regarding testing the inotify thing. A test that amplifies the
high latencies seen in the current setup by doing the usual
start/sigaction/probe/terminate dance in a program (like
usdt-tst-defer.c), and then having dtrace wait for the probe firing and
raise() while the process is started a few hundred times in a loop,
sequentially, should suffice: in the current setup, each of these rounds
will take on the order of half a second on average (making the whole
thing take longer than the timeout), while in the new setup the dtrace
raise() should be almost immediate and the processes will all start and
finish in much less time. Something like that, anyway.
