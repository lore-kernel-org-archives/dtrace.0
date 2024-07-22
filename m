Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D381870
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721606539; cv=fail; b=gKr+/vJtu3+1LSmhWzt5Y+S636m2Qfe0iynj1wHuafGs4WaOOXvbAcZIrGEAQ+aL+AIaADK497MbFEAUbXQch+rpbVom/iW+DgqrM2ekQ2rYgn6YkT6okWzhny870V0NmEmz7uLBAZaBOsnV3B+jwNwnSPrLkQxpVrF2lu2rdcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721606539; c=relaxed/simple;
	bh=Pc22OCTpdVgxFWbGmix+u2cU3WdXE+crVM2LFcl7kDA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RQfyr8QOaN5LXd5nb4mfwRJ15YqEejP95T6ROzMqrqsKIaPH9GsGnyvIw7+L4QCFOk/31FhcyV9G/VChO1DAtsKfuutAIDpSE2Pa+91lQLe2W9dMMhxnSWgByUoBH4SvuEaCr3XpdI/jKNQIiscQer5qy+5EDaNuzHDlLFT+nvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2kS5l0r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e5iVvemB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2kS5l0r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e5iVvemB"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNf1Q4006300
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=; b=
	C2kS5l0rMTwAq/aCtjduX/TXSS3RTsEEJOdjcU48JCUEJdnDTTTjWuZut/LCnxHL
	f9XKFH48kMsTUeti+A6fxKIU99JqyPkoWb/XZwsRbmEz+CURYfjBdFa4EM5xgtzY
	rW4TtYMzJrinLmLGrVzFaKj85wxq3g22J4LGkm5fgmgwl1orbB+4ijvHSlig9Kag
	2tCRlmMsmw64pWbPM0zKBLXWIYWHbmVQH5ZESJSs8uDOEhvKJdguZbjajtBR9wm4
	At4bJWvWjL55IILH9uwlgt/092PYSn7IcB1XD5LuQR+U8r1KGykum6F4U1Ga9a9V
	qNSw1ahe7VOBHDYk+ZkO+w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hc05r17d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46LICeNN035653
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29y8hnk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idz0W/cIMYjyHaVP1YSYE2jEIpYmsycXkGfXPGmfB550cR274GI+14dYbJ/RrT0XOnR72up65Wze7KarDgxjVV0ytOgyvYRIoihbhewHloTVL+X/jNa15tprlsGVb+ytfVBX42aHq37nH0TxjC9wyOe3F2cruggbv2UawDBsvsTntidX1CweLGMAk/ceZxvDklv5fOdveDVpQcH+iOwPMNfTXcdxfWGsYbvBlXHE0JRbC9b5KM+vdkEgzlg5CCtY8jwIz0mgKE0yDSB4j+zlDATzFDh8OFKugzBbCt0JGBUY3e1ULURSCsLgevl4cMVjMlWK4ZJeltkeRCgvIRhmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=;
 b=Nkr1nI8DdSN8G97CY0/kBq8Ba7mV8oSt2NveqUy67tbj+8ZIVwgEEGEKUlr5EyVn5m1bwqO7OOu1VH/j0ZNI8inIYBy/LDJKOJYkZd4z4cNf5XKdJ9yA5+N+ffnUAiprbtC8lYEV1O5royOXQjst7XuMg8b6VPckhmWvrtHhqEDvejaKYZ0jqyoMFUZ9C/0oini3RlgXcUyI0dghy+ZXa6PhXJ5KHYEm5221TTmg9R700i5AkqlNQsj3+RtL1Rc1oTrzA6Owe/NFupnCi4dxyCZCCpoq6gAblwoPHJvcMxYXREeL/T1qvNvBmlBcL541MMf69ihrrQdKCP4SJMDGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=;
 b=e5iVvemB4GVc+rnNy1xR/9sbMEpLSd9sYMAYmkkjyOaCaICvpb96psg257LszqPlAWez2HEENv8jRUQZZ4lm4sojHlPRwD/eAZWt/zCqf+55g462SEQTRaJrtLclrCiWMgO13S+jly4fcRiZqSsZQTxvUr+Ay/R7htis4TfNlm8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7357.namprd10.prod.outlook.com (2603:10b6:208:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 00:02:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 00:02:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 24/38] test: Handle dtrace:::ERROR arg3 specially
Date: Sun, 21 Jul 2024 20:01:58 -0400
Message-Id: <20240722000159.29840-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b5ddbc-2eb5-43b6-25cd-08dca9e18531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RPFJMymhX3LJc//nARBwPaA9f/2aU4q3Qk2fmpBzGAOZDsInHsJfZtOJp2DY?=
 =?us-ascii?Q?ueDE6IAeHNotj3XOWxz3gtGMhLKOWa8goHgATnXkGxHJURJQmt4yCOLVKVGi?=
 =?us-ascii?Q?UasqntmFWQnbFd7gVP6Y0r5hWcTREituQgxPYr7DK+MXVTD9UC6yhgZyeFxN?=
 =?us-ascii?Q?hRzUkmPTEk8ZHHeToxLHKqMLX9Ow6xtEtu0w9ZUA+/TntS8cRpWImOnwSY/D?=
 =?us-ascii?Q?NAvtMOWgmmoPJ3kKqUc5+bIJstXXen6t0ajjoQUOMOvGGtwoFTephFXmyjQU?=
 =?us-ascii?Q?4mDW+aXuDJWhQHFphe2w1kx8ndDeEZK+YTvMjcoMTh+CwXzog7x3wsQSUFLr?=
 =?us-ascii?Q?jAjx0GTM+lYyxpIbhBuLp3dkY+OTlUIDUZ89rYAg9Y11sEMBWhFEfTFsXi2h?=
 =?us-ascii?Q?LQqxVRLrOMeHtuBaPq+jnXO5daCyr2PRQyO/QvyA7j/gs1dqP+qQ1qpFBWdZ?=
 =?us-ascii?Q?fVC+C3YVIfXo2jtcBZBftj5+kqwp5nFjRfpUmxV2xyS86NkQoAsgjiVXwa+L?=
 =?us-ascii?Q?AkEaw6lfQGvW6Jhiom00ImVWxn1GUHyH2qoobVnHInNyq9SpvZGXI85HczOK?=
 =?us-ascii?Q?/w2WWP71AR6GOjx7valKYKWQRSmHoeRYE/MRV1Ih2gF5Te2fjwEJ0g0iyBAK?=
 =?us-ascii?Q?EmuDTKyCa2hPBeo5GMASYx7/2Z5LvazTj7+NapVWqVM3dvBeULazdpiLHcCz?=
 =?us-ascii?Q?R/WDqHj3vxU0pLNFmgXhoF4chw287xrUNwtqkyBxLYNl8dLxUAseItg1hT8Q?=
 =?us-ascii?Q?GfxjUerQkpRJBfMreTk+NDeyc2qNXEHJJKld/CFZWaT3JYo78J8jjcjxc1+v?=
 =?us-ascii?Q?Iz12nOmYF+wZVoM+fxtp7ypVYshuwkHjBnXwwm7vH67ZsF0g4gJRX3Q0Be2d?=
 =?us-ascii?Q?D4yOAe5D/z9dKh+sjvrDtPVZAhGyQKL9Ae7M93vxetcOykhSmCaAsUd4twUM?=
 =?us-ascii?Q?6+2xGAJ7fsUgbKgiuWdjTTpmbvtH39PKRPlUnziubJFFqEtu2jt0dNoUb6pW?=
 =?us-ascii?Q?gT3ik2FDnIZyX4atLxlnxFkk5nI6pIwnQrgZMtMsDgEn4f1N/1nzRgbQ5lMt?=
 =?us-ascii?Q?qkjMo8rR3gm+8KIAs65gwKQ7gnjzI3ifORSO6bKHSbjVkp/NeOTAB/TaWaiU?=
 =?us-ascii?Q?TZEX5hz+ylRQ9L8xVjhv2GrZwZglwc7d5ux5buzRS/wJnSHC9eM/+woZUS6m?=
 =?us-ascii?Q?qKSxOGvO1kOjVpndO2Crncrm6TQX6+49W8OHyRv84bnSNtj+gOTVyo81ikcv?=
 =?us-ascii?Q?g+I+g26+XwbjhjXvE9sW9EF2iNWDUsbRfJUzAdAOYumOzxqTjEe7xwWlYqYs?=
 =?us-ascii?Q?wSm9wSGJ50SMyrCIjGFSmqviJvlIIQ6ymMzWuAoUxWy3n4McFuyXooU9bxUn?=
 =?us-ascii?Q?h7bJn00=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WxRjSDkco10NUB118PyZA5s+BDv5Amq5e3lEO/J9nKilwa8OOCkGrdrtcmX/?=
 =?us-ascii?Q?gdW4oy1rqPdCWAmx9z6VJfWcV2MusDDNc19ekQED95gJBOJZk8tqfyHrw+oH?=
 =?us-ascii?Q?bccmwghjtMKXBQ/NCfqsHPzEOuPv+IwrSBo9XPFArpolf+AJX7ZkXxtSRNkJ?=
 =?us-ascii?Q?drVvqE7dlcUmK4M0oxkdmZdNMl1antpljgUnxUGttneOXQn07pJGdYPCGcyY?=
 =?us-ascii?Q?CgV/4YPRhWM5ICjJOMN5DXNApO9+RoloGd6qSWaRCs+rGMVRwFfP17EZ5nSi?=
 =?us-ascii?Q?dltodDgpc+5Ozgs3FCfNLDT5rLYfKtr94n202apT8w42JUIuoLnpKNiwVP1Z?=
 =?us-ascii?Q?dFm4UDdpJuJmoK50fd7t08erTtBEU90YLX0jAQHmDlvn14m17ynLq3k8+k7p?=
 =?us-ascii?Q?FVDw44+nfEK0vQB/efB1/GW8zGlX958J+KAv5M+nxiLx+4q4+ACiJzYS5e/5?=
 =?us-ascii?Q?FY0KPTzT5nKB3XIadqRqyR5zUDzEx1YR5srmRcoIxWwnl0zjiyT5+6c8zwjQ?=
 =?us-ascii?Q?E1IUGElkZM2QvJIie88yI+pb4lnIwqLBtvyz+51ozrtln3JWPoGaIP52Pj9i?=
 =?us-ascii?Q?u8hxozSu/ZyC3WZoVsOBAQ/0eCREJ9V4MaL9+I/j6V5UtlqGb6lpavIWvoqm?=
 =?us-ascii?Q?5eJglzOrN7eLOiBVwQ+MOjSj747DPHm6KX5r5RuJUviISoLk0EUWrX9RJFw4?=
 =?us-ascii?Q?tm4y7G0225h8Pf9i7ZF7fXoFuNrvCm8BfG7+tJjCgdFIhRMbgG11ZWF77009?=
 =?us-ascii?Q?O8sg5pqOze1pOOmauXSyV7Dk88P5p+kSP4cVrHsfW21Qg6vcF21oIveoWDNV?=
 =?us-ascii?Q?mrT21JRNyzffrbrtDZruzKVLumzWyYy6PxVzrAKCB2FuGgB//XZ+E5grwDUa?=
 =?us-ascii?Q?Fyc0NfUS12OhIGi755LXx3dZMf94D9YoZ+PMfvKW6LFukkZP2AnnExU3gvds?=
 =?us-ascii?Q?79IZKVmMhFJ+xyAxq8MM9Df0qnkoLeyjKtwbWM+rhDa6si944Rc6BwjH8pBa?=
 =?us-ascii?Q?VyQJ8h+GOjsN8QDfg/IhZHsRD7EN1GzeogWAjmU4wnuUo30ywx+TXd2tCOtC?=
 =?us-ascii?Q?EabhCuYW/k9/l0GUd9vEYX+zvEf7I3nB7cr6Wk0zHfZUI4Nj0x+3O5dB2kW2?=
 =?us-ascii?Q?EgLwdYQ0MOsCQ/2we0hR/aMZ0TYm4VtcYSlMPOOfx4lt167HCaky134v74Ou?=
 =?us-ascii?Q?t0p1SmF45ZMHhM6qj3JzoFL0U4fyWGZRWIFKaCsTpusqFYX/hJEB1jMWOGon?=
 =?us-ascii?Q?daXbSbaPpU6pJ3a+WK6/P/fO5DhNwe3l18RhbfVUHA1SgZ+oO7iAwDmR1apM?=
 =?us-ascii?Q?a52D74Vwpt0jJMeiPrKsloe/GmZ99jlVuYtBbrEGnKWGhg9miDVsDbS3hdRP?=
 =?us-ascii?Q?hPtjZlLydm/d2cWKMLubuxOS+xpkOUkidNZaa1kL0pi9/rq+gVCpYzDjSJaw?=
 =?us-ascii?Q?4963aJE6mjh1ydNpkmCf7p4C+t4qejVaOrstBdSObpJXtcWubpdnfBQJyWKB?=
 =?us-ascii?Q?6Af1mohI6H4c1WaS/naQ8IyANz9RqqPOGD2FyiiKr3DlOxJPuGoQPq/GOVuP?=
 =?us-ascii?Q?CJtG077pq8It2Bd6UrBTvpOKCQ5OwPOr7n4Nvojr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uUGY0GqMr5/Ny/iQqRxvr/ixopyzc3RUT/RUxwaduETpXmikuJVgz2cb+jxhrpWyfeaVJ8l/pNN66At7VyULsWIAmh9LV0xGfuGItbqLyf1cBwf8x6vHIxT/PJnGxp0dvWPniJKM7U/NNjYlBbqetVxrrFieToKXRM15+rzlMv0dc5WUKbMqyIGGTWlCu9sXACcjsreGpKRBFJP6QMuBKbifne9GasT4zrMEtFEV9sJE2wP6HzCnYxcYMoYtcFzvFL5+jCFV0fujsumwpbMDA3JpSV6PK6Js+5ZhhLveQwiEvT3Em002lz1ew2c7OtpMmpd89raAqPBydg/p2kqG8UYQsy7GBe/xOegcKAneFlLlGcCRmeyb7fPP82613ueclmXqN9CpuqLQoyTXh9DSopF+8I8GdnFuGCsUgQyAaSF03URGxDqYMvAVNtRiVVxDJVMflBg8Sb8mEO2znUdylUV7pCQq7bVADrbdhDKbO0IT2SV1G2bFqo8XNvVxsYouEqI7mNagJdfinnkwnzaxvubLAlbQPwRKEgCwMyIB7kQFpb8qLf+3uyhPGte0FDkkV08oMHSt5tloetV05xuPpFOv+yPNK4BoTCZQEArr7lY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b5ddbc-2eb5-43b6-25cd-08dca9e18531
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 00:02:04.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaDHdvtEQQIsPojRDEmrmUhtkpZhtsEpki8oXOkgcdEEmXOaOtUWIDgLGJQ3WSlBO5KvMVfc/GrwBnLX38egkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7357
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-21_20,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407210189
X-Proofpoint-ORIG-GUID: FkF4iiKrVbQO5trKwcAHe23KbboN4kt5
X-Proofpoint-GUID: FkF4iiKrVbQO5trKwcAHe23KbboN4kt5

From: Eugene Loh <eugene.loh@oracle.com>

The ERROR probe's arg3 reports the culprit PC, whose value can vary
with minor implementation changes.  On the one hand, we do not want
tests to be overly sensitive to this value.  On the other hand, we
do at least want to check the value is reasonable.

Therefore:

*)  Change tests that dump ERROR's args to omit arg3.

*)  Add a new test that checks that ERROR's arg3 is reasonable.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |  6 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  2 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.d |  8 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.r |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR.d | 92 +++++++++++++++++++
 5 files changed, 101 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR.d

diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index 001903ff..bfc77bf5 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -19,8 +19,8 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
 	exit(0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index b11f6c99..3e7caac4 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,4 +1,4 @@
-The arguments are 2 2 4 1 64
+The arguments are 2 2 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
index c23f9503..ec519f4f 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
@@ -1,10 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 d_path */
 
 /*
  * ASSERTION:
@@ -18,8 +18,7 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x18);
 	exit(0);
@@ -29,4 +28,5 @@ BEGIN
 {
 	d = d_path((struct path *)0x18);
 	trace(d);
+	exit(1);
 }
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index 8c601a43..be1f6d5b 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,4 +1,4 @@
-The arguments are 2 1 28 1 24
+The arguments are 2 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.d b/test/unittest/variables/bvar/tst.arg3-ERROR.d
new file mode 100644
index 00000000..6c2f5206
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.d
@@ -0,0 +1,92 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'arg3' variable can be accessed in the ERROR probe
+ *	and its value (PC) is reasonable.
+ *
+ * SECTION: Variables/Built-in Variables/arg3
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	nerrs = 0;
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[0] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[1] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[2] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[3] */
+	trace(y);
+}
+
+ERROR
+{
+	/* Record the problematic PC and continue execution. */
+	PC[nerrs++] = arg3;
+}
+
+/*
+ * The problematic PCs are likely to satisfy the following
+ * reasonable checks, though it's possible that some radically
+ * different implementation in the future might violate one or
+ * more checks.
+ *
+ * The first problematic PC is expected in the some range.
+ *
+ * The next problematic PC is expected to be PC[0] plus some
+ * delta, including some special functions that are loaded.
+ *
+ * Then, the next PC is expected to be PC[1] plus some delta
+ * that is smaller and narrower since those special functions
+ * do not need to be reloaded.
+ *
+ * The last PC is expected to be PC[2] plus some predictable,
+ * small and narrow, delta PC[2]-PC[1].
+ */
+BEGIN
+/PC[0] >   100 &&
+ PC[0] <  2000 &&
+ PC[1] >  PC[0] +  100 &&
+ PC[1] <  PC[0] + 2000 &&
+ PC[2] >  PC[1] +   30 &&
+ PC[2] <  PC[1] +  500 &&
+ PC[3] == PC[2] + (PC[2] - PC[1])/
+{
+	printf("PCs: %d %d %d %d\n", PC[0], PC[1], PC[2], PC[3]);
+	exit(0);
+}
+
+BEGIN
+{
+	printf("ERROR!  PCs do not seem reasonable: %d %d %d %d\n",
+		   PC[0], PC[1], PC[2], PC[3]);
+	exit(1);
+}
-- 
2.43.5

