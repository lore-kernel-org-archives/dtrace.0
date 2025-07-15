Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813C12DDA1
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558509; cv=fail; b=UxyxQpv6W7QrFCj4/nXTZAR6DRoURpoEyDbJbYgbN7ySkxYafeiehj1zzBFlxnffxiVGL8dRsLyzBIodtFjuBaO+gLGK9VA+SEW6BsWpg1+inuCCLnLuy8A/hAQeQICLWu0wDHV3tgYbzPKuZVggj2pN6PVZ4QUGNCmpUjQzUOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558509; c=relaxed/simple;
	bh=3GgkNK7pAU1nze6/xXoKfmrw1MLjFlJWh9oU4eR9i/I=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=smyu8kXMMyw2W5+eFFALa7LTyf85TXr9cjxyBf/PSKsT+xvj7aWbnANELBLXE7XNyycoP/ZDIBlzF3y5DZdmtJ2rJHbBotZvb5eFWD3WXS/pctO8aUCZqcUnsX+nDK8uWXFqOJ86XzZa42E48NJ2x1woIkCDGHNWF9SMW/10wWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nPNa9HOP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tn74osep; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nPNa9HOP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tn74osep"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1ZSXv002364
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xF7IkFdF2hSivL9xt8dbgqzs5mdRZRJ5juA6f4eCFNA=; b=
	nPNa9HOPNvbJnFpRzPFbYiqI/0CH7WvqHJQClzCYNseAF6gVXkzHBS1AsN7GtMCY
	411S4QaPvvcLzl7pXq7VlhzfjiKEo65FT6AKW5dCBMPIv6CfNAJQGxcRouQq0dej
	+TUBqk8i45WFMaqGl8s8eBLA45CkgKDSMxLYdVqMisSjXhkIrSErUDTliZzc6jQL
	qUKW2mUS2FlDpVGwi1Z2IeS108YtOivi9yLL6r9ni19oMTFvjDYyYliUdEd9GchB
	BNan+Vu62b1jK0Vy+lhEoSdLDNBLFyO89fsu/L34Q+6H5/qkohOC3bvtExNrJykd
	VdBLbvBQ0x6IoYkcdULQxg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1aww39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F47uEY029002
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:25 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5985mw-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIj4Dja0aLhQZOD0HlKsNtuoy8gP5+4dB4k1RiW0pUc2kC0zg3i4chjNEUzlxxQLlWJ9N0afkm2YFz/TK7yNFhY1CP6zC8OtOyKwZmaHRcyRDW0lZCwvzKgGQzTgzzFrsqE7Jj5FIWkeIDiKBWYDrEPpcnTLXrCDKDbz5ydw+qUerBlgadzO3k3tOAc00lnxyD6IIAuHo2botmAss1osesmPJxWuzoKHYaOm2+Sgk90Lw0yyyLJ4QjO5nFzeW/mwAntVpV5TS3jabJhB+RNaPusSRmPQrKEZHZt7WNgD+cgUQmBDs4Bcss7CP1OPCIaKgGAc+SyHMK7xj+4viziduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF7IkFdF2hSivL9xt8dbgqzs5mdRZRJ5juA6f4eCFNA=;
 b=QOGccqTfCMFg+j9ve7zK0/ztqtYNJuXUFJqjD+KH8JCz7UkHigUzKZZjPxN5gdujLI9ql5fuw1qkmLbVdPyRzszwD9b7IsX+N7vBmhNw6NhJ8CvpmTEwsOu18sHi9n3UM6BW6etJDe2wuwcSXcDFGpDVzvOSCF9oVtfibochslBodsPJa295uRTLOcruPPfwHsU/OOa2MZMhB68EvkVtmHIq36ZB9h2jABMY8g09k9xgbJ1lUGQgxVl6vKkO0q9BQNyDpPzVGEyfDN8UFxyeRUjEDS2c1X9/RztebRRsgLjUPMXK6bmtf7EzAtui+0+jWnfddTpuPt9ZPFa9gSFsTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF7IkFdF2hSivL9xt8dbgqzs5mdRZRJ5juA6f4eCFNA=;
 b=tn74osep4E+cC7FKFcK0AfR4XSJdwc9shgeuz2jR389fI90Kpl5z6OU7CEbtRMPEiMM8rbGyosr/0ELBTZLJ8cCXAyt2BZVwrMZfqbYmtRF1jCWntbKqAqyKq4QOrZSE1bGDG2Y6U9jbEk/MJpYuwO/MvjilyR8eVpOL5ANRu5k=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 05:48:23 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 15 Jul 2025
 05:48:23 +0000
Date: Tue, 15 Jul 2025 01:48:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] cg: reject clauses using return() by default
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567264A32C578A83EC920284C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f270203-41b2-4deb-5d45-08ddc36335d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxblrGfF84Wn5L4e2HzJJagkf3Afqxe5g3aaNc8XRaRuW54Nmm7MfGbFZ7s5?=
 =?us-ascii?Q?bQ4swpAtue+mKaKjELmpI1R0ZU1kpL2C15UQ0OoKaXxnPKMbbhdw9Ibt9se2?=
 =?us-ascii?Q?NABZo83TiUTLbMP8IpbfKPUm0uA/0QMCwcvZDO8KUDhyEqPG83i4zUf2A6Lf?=
 =?us-ascii?Q?P7sxM8Goe1g5VarrdzaRzOsV0lW+wIppRdMALAiU80xxaLFQ3WXW+RTOVlrx?=
 =?us-ascii?Q?8zz4AfQ8f2+SUt7UlwA5azZS/kOu1jo+l8ScB52w94pG3NMTgZT4vFCDHt4w?=
 =?us-ascii?Q?KK79dNG0yU5m1LW+yo6IuWehUd0Fh8fyg1zYAvtTEhOYbCPdHml5wf+EGyuH?=
 =?us-ascii?Q?FWl2QPAK67qImv3tudOrkLAKpxshGY16F01fa3IkqiL1OU0/v/tejMF6Us+3?=
 =?us-ascii?Q?H8wFZlYSWH15FnvULLHliJadDqy1uIVLqSFVENyyB+zBESx3KAxkZMfzsG1e?=
 =?us-ascii?Q?QhtdUlZTUpnq/hag0aVfS4BoImUCPPswzu57OAs70QGSk71Dsk9YANb7u0ga?=
 =?us-ascii?Q?FLfwuyGZ2MeXfdZfb6FUZVgpiIb2f0NNIAEGHXubUneSgUCu1txZq/C5c7Ha?=
 =?us-ascii?Q?QiaE4hTJNFG908Mqpv84RME2UE8w/KA2QQq6hDGlnquvaszxnuUWeK1A/1hT?=
 =?us-ascii?Q?YBlSy4LsntQw9m5XRQzaSW137z9Mt//pugDhaDBtoB5SvLjU6PRd/utRPGRt?=
 =?us-ascii?Q?giqCNM5srw3qnaSGcGTIBJ8AIlV0kUt7L/v2e+0CZyC0c9ZKKjQpZOzwoard?=
 =?us-ascii?Q?BEdfbwB+viqUE5J38emF25ju4sD5MoaHAi5yvM9C6C8F16A9fnQM5iCXrho0?=
 =?us-ascii?Q?4p3IlRvWSq4T5SaoNlzpX7V9umyhEhcTgmlvRxixYBm2G93XdeP71A0LATT7?=
 =?us-ascii?Q?d2RBPFrphQbR7xRg2DkrHqeHKR/2vMUtjWImIHcm2M3jK7TuQc3X3v4J8DZi?=
 =?us-ascii?Q?+5w/mJTLnL/twDt4YVGdhd9NLlBuFQq+C3za797sTqKm06V41riFYFef9Xu6?=
 =?us-ascii?Q?pE0gNDOcmWxA/UXe7fERIzr4lHz61vjE8JrbyQLUCw1RRIbSjs9ZClUQmM9P?=
 =?us-ascii?Q?eqC2MzQH/NOQXEH2hnzUfBhu/agK5nAj2IQ8wZ1PSpvzMsdQz9U5MgTkMtV9?=
 =?us-ascii?Q?tkzDv/RQj8V4PSb4hYfBJILtdKUaciqOSV19IkFcLvFmtV4WNFGY87UOqKLD?=
 =?us-ascii?Q?QwtRUxay4/A+Abi4YBooykSYCMSwhCe3FvcOJKTGId8fG0YExpoAP8bfMv0i?=
 =?us-ascii?Q?i2Vuk8lg+6kyScKeCiXMsXhvdAcAocLUdFwwxxMFN5tvcv/uG02x5I11RErd?=
 =?us-ascii?Q?6wp5FvEtIYGTppNHI1C96PFRVROG1hgyB99gAeWOdfAWDrSxV7ZanGFbqtHM?=
 =?us-ascii?Q?311Hbon8ngfiJ8T5bXHszbDEKkW313hQdAltUxDJoS1skJyUv3qnhnsTbRwS?=
 =?us-ascii?Q?lHpfiObnHGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDvAMKE52Ejnd1KM+W7id1m6lF9S+E/TpgWXhrgwdOyocL78BTZDcDfGfxl/?=
 =?us-ascii?Q?IQHKuNGl7CUe+Ur+7TLRJyAyblI1E+aNB4U1LqUDVa+DJfoz+2v2utBNNRYr?=
 =?us-ascii?Q?+5jHd8oBid5NiNJsUNm34EfdVK9BcQ1DNVpM0SUjKI/lY4ZhtfJt/jLZwAJn?=
 =?us-ascii?Q?jbrEwuvwl8OFqPauWyFsLoC5Be918qDos+6Jr0+CO+GOO3hpUAM9y2VqZ2qB?=
 =?us-ascii?Q?SLtY7owI9Qf3St/BVGhAAWDakA69Kh/+xZ53SBWEPcaeJ0ROpfOG/5JFTR1W?=
 =?us-ascii?Q?4gQ7Ztm8nsefwC97Y45ZySdp5h1LHFRcuN/ZUJxSEsJ32DwJrNHWQC6hiX+/?=
 =?us-ascii?Q?6RsyuJ89+Sfsw06PO6X9lcrzt0lJw1eoSKNwCwngUoL6QGRqaO/rdg/l/gTu?=
 =?us-ascii?Q?P7l6xjUQ4sQzj/Hb+42NAJBoPQj1/7zKZ1xbhzzLwuK8ffQMf2eJbgPA66fN?=
 =?us-ascii?Q?L5n2dnrjrAhqxWx7Jn4UGHlFi0g+F4ylDQ7maTb2JajQXpV1PkYeWEUrIki4?=
 =?us-ascii?Q?1tKVSKKjeq64mKPHZbH2xnuD4oW3gjzbF6DT1sQTngSzhSQZ0C5gNWF3IC+a?=
 =?us-ascii?Q?t+yBNQ2HOQ9Ztdj+jHcgJLxhvnYjSaQXhsv08GHhBpqhHxe4cTHtcCI40qO7?=
 =?us-ascii?Q?O6yG4E/Ij/MwWWdJmVesdQjXZi0yBxM6tLmfWinmRYF+CoCq7tl4nby5JsJT?=
 =?us-ascii?Q?ZNRuobNhjy5T2UPPkOzH3sAj8KFvqegmmThORU2CtqqumqA/vevjHCbL8Wop?=
 =?us-ascii?Q?XbP1LArkwzrB+AqOv3bnJhRJooaJWVI74PZgs2+QaL1iqhy1wElPRSek7RkC?=
 =?us-ascii?Q?mxaQaD65IYVEScfW1FMYLcV8f2EUTS4igtkNQGN0dUbTyRNFzHWC6+sKNTk2?=
 =?us-ascii?Q?RCZGlJJEMCTBy7q3HFpDBxPMzKo7sRTYKwkSWqVheQsxrS2s/+NocSyhmNhB?=
 =?us-ascii?Q?oYhhFbXvURfKF/ivNvTbgkATy9RQ8g8USiSPf6unNMZ70WvSZu/yzg+gTBQm?=
 =?us-ascii?Q?+mkM7Bd59jfproVLyT6OM3LitMr4gdxBEfDH9k8J4UNMCZqtffELeJF/FjrC?=
 =?us-ascii?Q?zrihYIE4j0np0j7V/bRM0KPons3PusTCsGtLcdLH/u8rdhbZmQ0TQxLzV87J?=
 =?us-ascii?Q?r6gVPqA3QmIAguNKJvgLmvdf2bhy9bFiUFqwKInejcpe00srJUlPpDYDHE4r?=
 =?us-ascii?Q?JNPYTB/1elAe6lJ4iq2Mfr0CDl8FMT03t00IBozhXWmLwY8gkRIIl05Rd3od?=
 =?us-ascii?Q?cGfUYWAH1k9aDz948JGFhu7iN+C5hbxfMqYeeq1g4LB/IEitGk3QNW7c4wFq?=
 =?us-ascii?Q?K/t39bJOhCkOUMmZvpTjXxlm/7071SqNnKxjWF/3xlD3/j/mGiCYlC8tGb6a?=
 =?us-ascii?Q?YAfH+ib/IkEyrqxn6SL7K43p2HXAuH5j0oTnUNnvtdEYUsnAb+zEO0wRR6Ko?=
 =?us-ascii?Q?J1wPvGEN54YaMiiYVygADWyCbQTMB/LZH+yUPWvUPtGY8yaZKEiJRU4fIvRH?=
 =?us-ascii?Q?/qHmj1Us9Rguf6iSPiS0vNfib8TtZj3sIGM5Ru+ovMbEaBV7S8haqSEHqDrI?=
 =?us-ascii?Q?g/zwKBxMRifwiMnOO3SzsnniMSs/5Egdv+lzm4yHRK9kxS67pYp8lSurX8ta?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V4T2LYG/Jon1Yeu/geKBP16gLwlRR2bKCX0h7NmcrKAuV7E8/u4231U94yygZs4DqFpONoMlNYIElRurnslTUsERrguuLSmv2E8mXtQHclvjzidy/RmGbnwOToUQggxQ6q7V4BBY7lBuwqHRJ9lHypHl3/4ovK5c7e2VLsfp+LEa+nl4r0Xu9uL/ub43PeiUdR5CnTIDmOtIJRak35F5n/FyipIPYEZ8rrwuNgTEWYVT4aOS4RIdTt56O8jPPD982TUTFq+r4aZzM0cNL36DW3YlekFmpQDxwPSV09lnTe7B/fIfgRWDsGn1mpZUSqW+rdQOLhbVyzlt57W+2ffMae1j5LlQf29N0geIGnGcDapROnZ8ghgVI4wuUuWgWZSU2saM+dZ7Q73bOB9NnkpeqFCUX+qOFlQVfF7b6kdJo0ft/Xo8qZKpxXapbrlC337TxDQD7EXfv4qOkzWxnTcC8IYJqOKCpHcgvGrpd0+vHyw0HNx08rVD49n/KNLr8eifqQ47d1JdhqWrTa96SzaBLQXrUuy/JLkt9DRr3zmlandEGquawecHNXEN8sHK5EYkJ4uXXSkb5TsMWFN4Zr4dW9w51rhto46nJDxKaSgH16A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f270203-41b2-4deb-5d45-08ddc36335d3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 05:48:22.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4+m/5Aaq/Al9sxjETssz4UgCIj6YxvouRP/DNGt3+HcyPTYTBqmRjsv620hYgiCjolRSE/5lHjfcKRM54/CqADwiSfEHdc7P9WXysey4y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1MSBTYWx0ZWRfXwpB9HFLTHTxo FEeyZ6t2CS3uOa4+n9I6IcsMgnyxm03d4vQfnvcWyY9P26WrVLxkniGbGi6+RsiK67A3t1WPO3d o76+7FoEw2CwUErInIlOh0HJGCHvRng2GUpWSEkrtNaiqhzQadwCmuluoQ/pi7HVRkCMrD8xQ5w
 qeBFJBPhedmVdbBTOwHiBhublS1S05vzepkVRPVvAVDFgESZvh18+KvHELWX1l/4YDm7LNk++C8 nBcegsbmC/FC9RoK2Bxj01VhuMurD5SLI1lU8/odKi8ZIeRqm08zuCZ++8FU7+HEGbc/3oton3+ 5eSJUQJlfP6J89iQ0t+TTvyas8JeDFRkdhjXCQCYr7QStIdfPfss145Ahe3wbCPpq+WpWY94bWm
 CCrNPOj2c31JIlH4uRoDqk3e1gIseyxiepqjlT2s3TxUGX1hHKEXqO0ZAWZVJWGH1W7aSBb2
X-Proofpoint-GUID: __WSJ7lvX1ZLQjRoX6r3zUYnkYnU6cNe
X-Proofpoint-ORIG-GUID: __WSJ7lvX1ZLQjRoX6r3zUYnkYnU6cNe
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=6875ebaa cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=L8W4S0Yo9LwUQijreGEA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c      | 10 +++++++++-
 libdtrace/dt_errtags.h |  1 +
 libdtrace/dtrace.h     | 19 ++++++++++---------
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 738597ed..0607cd4e 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -875,6 +875,10 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *ar
 	 */
 	if (prp->prov->impl->reject_clause != NULL)
 		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
+	else if (sdp->dtsd_clauseflags & DT_CLSFLAG_RETURN)
+		xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
+			prp->desc->prv, prp->desc->mod, prp->desc->fun,
+			prp->desc->prb);
 
 	/*
 	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
@@ -1810,9 +1814,13 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
 {
 	int		*cfp = &pcb->pcb_stmt->dtsd_clauseflags;
 
-	if (DTRACEACT_ISDESTRUCTIVE(kind))
+	if (DTRACEACT_ISDESTRUCTIVE(kind)) {
 		*cfp |= DT_CLSFLAG_DESTRUCT;
 
+		if (kind == DTRACEACT_RETURN)
+			*cfp |= DT_CLSFLAG_RETURN;
+	}
+
 	if (kind == DTRACEACT_COMMIT) {
 		if (*cfp & (DT_CLSFLAG_DATAREC | DT_CLSFLAG_AGGREGATION))
 			dnerror(dnp, D_COMM_DREC, "commit( ) may "
diff --git a/libdtrace/dt_errtags.h b/libdtrace/dt_errtags.h
index b8648d17..65c59cba 100644
--- a/libdtrace/dt_errtags.h
+++ b/libdtrace/dt_errtags.h
@@ -158,6 +158,7 @@ typedef enum {
 	D_AGG_NULL,			/* aggregation stmt has null effect */
 	D_AGG_SCALAR,			/* aggregating function needs scalar */
 	D_ACT_SPEC,			/* destructive action after speculate */
+	D_ACT_RETURN,			/* return() not allowed for ... */
 	D_EXIT_SPEC,			/* exit() action after speculate */
 	D_DREC_COMM,			/* data action after commit() */
 	D_PRINTA_PROTO,			/* printa() prototype mismatch */
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 20672d3f..f0c1b8dc 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -154,15 +154,16 @@ typedef struct dtrace_stmtdesc {
 } dtrace_stmtdesc_t;
 
 /* dtsd clause flags */
-#define DT_CLSFLAG_DATAREC		1	/* data-recording */
-#define DT_CLSFLAG_SPECULATE		2	/* speculate */
-#define DT_CLSFLAG_COMMIT		4	/* commit */
-#define DT_CLSFLAG_COMMIT_DISCARD	8	/* commit/discard */
-#define DT_CLSFLAG_EXIT			16	/* exit */
-#define DT_CLSFLAG_DESTRUCT		32	/* destructive */
-#define DT_CLSFLAG_AGGREGATION		64	/* aggregation */
-#define DT_CLSFLAG_USDT_INCLUDE		128	/* could be used in USDT clause */
-#define DT_CLSFLAG_USDT_EXCLUDE		256	/* could not be used in USDT clause */
+#define DT_CLSFLAG_DATAREC		0x0001	/* data-recording */
+#define DT_CLSFLAG_SPECULATE		0x0002	/* speculate */
+#define DT_CLSFLAG_COMMIT		0x0004	/* commit */
+#define DT_CLSFLAG_COMMIT_DISCARD	0x0008	/* commit/discard */
+#define DT_CLSFLAG_EXIT			0x0010	/* exit */
+#define DT_CLSFLAG_DESTRUCT		0x0020	/* destructive */
+#define DT_CLSFLAG_RETURN		0x0040	/* aggregation */
+#define DT_CLSFLAG_AGGREGATION		0x0080	/* return action */
+#define DT_CLSFLAG_USDT_INCLUDE		0x0100	/* could be used in USDT clause */
+#define DT_CLSFLAG_USDT_EXCLUDE		0x0200	/* could not be used in USDT clause */
 
 typedef int dtrace_stmt_f(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
     dtrace_stmtdesc_t *sdp, void *data);
-- 
2.43.5

