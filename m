Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A594207A25
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236618; cv=fail; b=lWxJeLQYQyj8R00AfgNEWjGQLeH+jvGglKB0RVERavrW9bA/G2wphlDf4TxE9QfYlCzm2yzLwvQdS8Il/P8xpyHtWLh+Jmsdjye7cX9cJfwZ0cKeByu+C96+kA4HXnpcBhVH8HxmZ1xFkYun8nLNUFH81AyEXgXYuhnymTt2kxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236618; c=relaxed/simple;
	bh=RuhRg4HtOtgcNDfWWFPfW2tnq5FdtEluxRijqyPGVv8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fhTCGUIScBEx2FzwszasFJFMt+WcyyNEs5JjGfQ38sjpNv2ipeAkYoStmRqGrRofEw3yRtPX4G4HezA/h6L0cB2Ub+KHZG20N8/GGxH4Ep/Y9qOzynJ/TY8Yat9lFgjjvcpdQ0hqNCYzGku/w+aQKi8NNmNpvpfeDqDP/vvSPOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I1m9+5Fp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UoVUpfWq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I1m9+5Fp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UoVUpfWq"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfVS3030924
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=jIbIyWzaZfTw2NFRMm9BiE9M36+gbsq/UEAnOguL4y4=; b=
	I1m9+5FpvKlYUyN2MO21WlnruK0ucmJcjs5oMb6chZZKo5Qzs8AQQHx7pCZ6iLzv
	cSxYAo2S02tJv4dO4+Qeica3EzHeaA26CWwkWhMAYkIMhvMcgNcXUYKbd2agjtHK
	axxjXPqA3i4TgG4feHyE8QM3GUmg8RZLCtbmS+s6MnkbMJ2J28SQmArmdhI3LI/H
	YhEOULr/qkKj4pZ7qE/7rjzEBsd6Yia1wkMUWqPO0g8IJ7HvAa0UN4MfpP7nRBXU
	INmpVo1+hoin0fZ/AzgNI0gEs7zOEc8nvWoswBShKBKYjnTb3W89efbm/E48YoA+
	Wdtzi66IolF+4LgZl/CapA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp6mk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:16:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKcJl6008499
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:16:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnea8kdq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nk0oKgOEHOVri8N+lK+oO6p3ITPmfxIy55OHa8b48taVp2P5i5V7JXydlTfU2UKSlTAD7HGz9VgsKVNtICWfkWfTS5eggxJcFREC9FYLjgNK/iRoF5fCELe5rUjqL+ysyNeOaWb9nKtcPtR53V4UwRvhaYiubDHwN4WfL3sk/RnvzgNBtekOtpj3CqAlc1JPlceKESHZenW1gEZDkm80KxPrLZ3jNbJJeRcknXiV+I1cWiG//K9gCrHd+x4yr0W5+LXeon7K+xQLDfX3YvsZWF/SNXsvWuxrTAcGaV/bh3OfJhO6y2ATzIUxqYWXs5GmSz7+FhOQw2EdL4z3EWN2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIbIyWzaZfTw2NFRMm9BiE9M36+gbsq/UEAnOguL4y4=;
 b=hxtwO2GgTERSkeBv5nBrRrcjHAmCMl7GqtOgMsdfD9gpEJzW/50aM7hU31juQ6Ji9PWzi+a0SwzOgcqS0Es2Cl1amPJ+0xGigtgzccze0LgzByl+cBP6czQNMyBhjciiS6ZM9UloRhLaiDReulwZNr+6cRfqDTTjVIThrKaK3122ZceWfJjgHL11bfFLUABjcV+ilL8h7876houYDRXWBefB6VfEtU5CINpiZLqrktxLcbwxsJXZjjQ4Z+7YORKULQIZb8uxw4YW1dCDDQMlDi3NQW5aFY863CIDXTHDjmatLQ7uu2Q9cE41Ni1P0IPLWv8kVs8xiSgEv9p24sBsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIbIyWzaZfTw2NFRMm9BiE9M36+gbsq/UEAnOguL4y4=;
 b=UoVUpfWqo1sFjFAlK2Rbu/ZR9eGS+Y2evpi57E/RWu41sm+4WY5CNpbw4sqSkLeMXavFYfNeVqM2WEaCjsqd9qBnkHSoGzPoA4DfeMyz9lQV7nHOC2l8RlrTExyBmLro3Jhb8oJ0zAidJvrSvRUSD9980GGzmqjbfvu2+A2Zn+E=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by MW5PR10MB5763.namprd10.prod.outlook.com (2603:10b6:303:19c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 21:16:49 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 21:16:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 26/38] test: Clean up zero-size speculation + chill()
Date: Tue, 29 Oct 2024 17:16:43 -0400
Message-Id: <20241029211643.1608-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::24) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|MW5PR10MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac58c53-517d-400a-a9c1-08dcf85efe80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZKd8gYUc8+p97WOOsNWE7mtWZXDkDerlrwxY1YA/jy6X7ORBhtY6wyomPIB?=
 =?us-ascii?Q?uMJjx0hY2CrxxcEHxQ7uXgy+t6tMW3ERASsl14j1VfmYS0apZKivPycrvkLF?=
 =?us-ascii?Q?Rq2BYvdm7U4YA5q3U/2JhlkuAnmqcMvTWgszJWbPCY7KXP9EnlR7T6oG5cQZ?=
 =?us-ascii?Q?r4GgQfC4ZvDOUjnh25ZqzjX0pYSRPdm8oQ+Rqo6Kicmzhm27msvhyewbTjt7?=
 =?us-ascii?Q?H9wjxsWK6PMdl/v+kZjEDrvgrdQ0BQHAzfWdPNefxQS8CYtdx4b9U5oAcjpY?=
 =?us-ascii?Q?xzmWqTDOIoYw7bfzAYV5U/HAMP89I+JI34MWaemNJzGOTY+lSsMFw4cJgWpI?=
 =?us-ascii?Q?XPwD0mSKMxL3Pgp+yFJZbHco8VS+5mzFUMatka2UGMGYm+GPw3LI3eWCx4If?=
 =?us-ascii?Q?dp7ahVMXQT6pTb3s3WKef416z73OTqmqE0r4xsa5UpKhL/WQbPvhghsnSWns?=
 =?us-ascii?Q?k4QeU4ekLvI9Fkw4WfyJdonY5PoaVqey0MAuk19BgwplpNooAmPkMv+nc4Va?=
 =?us-ascii?Q?0lmCnTB4bXAHBNxzMaSO3j9fexnlUO30U9lxXofW5ePtN3BYDOXr3jMzIxNu?=
 =?us-ascii?Q?kVtaziBuFEyIo93VSmkwDzrOPBifEzeoVTi/gjICquykAmz4dIR1vMYqjpRk?=
 =?us-ascii?Q?1IskNLfOjFzqPj/PEa2h99pAlafJ9bj1jiuflfuHP84SzhjStD6FcNhNQDqP?=
 =?us-ascii?Q?5/tsFRku2eLcWTdojPPrGNAKxrkGXrRKl8YyviHJGCZzxts8twYA75FV4Zs2?=
 =?us-ascii?Q?jy2XGS+JpIcoc1xvMTVqrUjB6NV+lEmPd2bniqzWkHsE8wecfNgsUlSn8bFv?=
 =?us-ascii?Q?aauZUXV4AkMxWkEWdmQ6Y7GujA/eim4rrwdKVB3MPDG7ltU/W+NA0eRku3VM?=
 =?us-ascii?Q?1hivicskYQMd3r/dQRFbWyGb7qZ2ZjmKW3Yca6koA18sh8Oe1Z9hGBc4hf2M?=
 =?us-ascii?Q?JcO6fLAF5OHxnYBIxSxBmRF+T6QPTWj2uZPuNQayaLllfqdsVq7nDpMp+/IB?=
 =?us-ascii?Q?03hPVZKvWgxgtkE+2mfRaNO6coCDNGP0+H2FuyU2G+gbyI2pT2BoCBDywe6I?=
 =?us-ascii?Q?6MjmJNB2Vmm6K7V6vNNeUOVO+7DnnW5lfoWwmDYLAqEwKuy7unia7nMO+Uo9?=
 =?us-ascii?Q?NQI/p8EvUruFAkXs+1J/4vjRxHAF3sXoeb+QkgJtiqUKLLq1NpdaodWJJmh3?=
 =?us-ascii?Q?fAIBAAfc7vd1ZXtAmg0Wl+2AmEx0hrX2hCGyZjnqMn6MMo9e9gW0Oi0gLmVU?=
 =?us-ascii?Q?Arc4jnl8zcGBczA2aGeFuy9YS6NoYC+5WTusjN0727RXOsj0baSZkjGWmSrq?=
 =?us-ascii?Q?B4GHIB6YPPrCBevPQPH/xllV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/8TNSmBzlT1d/3Y3XVnBVJYNvZIzHOCItb3XPawbrukz/I3wvVEvMN7uBFlf?=
 =?us-ascii?Q?FWGu1MPTjSkZb+O11MGLqD0KgXgGCDqHJ55zBl7O7uGrOQ9d+WqyCR71Ppn7?=
 =?us-ascii?Q?RzXT0yYWViOVXj+3wn3bvsnPxlSBpTd1ycAcxxg2bXxkDCJIpK6LAsO68Cyt?=
 =?us-ascii?Q?Q5qYvJ6y5zp9BPQ0WJj8n0F/lDuI4zxAJUJGwSEjfSiQoatjQZGDifdtWSBU?=
 =?us-ascii?Q?Lj4R0i9h4FprTSE/bEreSOJw3UIPIZ6bXsSb0UROjt+jCqz4KY5qm1Q2nwuJ?=
 =?us-ascii?Q?3I57KJ5hAs67xw8gHFcynfg1zdfMcoLD7PE0GvFDLV+tO0zsODFeKX/kCWvr?=
 =?us-ascii?Q?CTmL96x7lSg49ejjLGwAoRyRct7HeaU4Skqd9TCCL+B/APXXx5EW7raZdKqC?=
 =?us-ascii?Q?cVV0DFOIQNeS497qpMeqLp+MSo54FwB0Pq+lKufmrHbOA0964gs2KcO7XiX6?=
 =?us-ascii?Q?AysibD/yuVZZwvW41Bp4DGxQv7s1efwD7TGEBcGW3bpY5dDs7oEc6zv+dam/?=
 =?us-ascii?Q?MDDV9qLiVh87j1O+tzoHps4ghiAuW2ByKi5cUkM6kxzM5xXDy9/HWcyoNGZ2?=
 =?us-ascii?Q?/ef1ZnnWJvp4GaO3ZAmT4S8EKkxACoJgJfEKfYFGD+7NK6NDxCKAhWeeE8Ry?=
 =?us-ascii?Q?3kg0JlLhD/87V2ECaDJilHufQc3S6IRWjcZBvZyx9v4NqsGtRZfGDkQJfO0U?=
 =?us-ascii?Q?XXefEnt0Jxt8XRRD+GAWJYn7E549KhbtXYIS35+ZRoOcHtbLtrxPw23NrWrk?=
 =?us-ascii?Q?8PTo2HS+vTkN7cj3VAJ1yf8/rld4iL8At8yV2HTR+2NDVnPczqlOsO1mySq1?=
 =?us-ascii?Q?3NvE8lN6z4fzWPmnd2j330SThvPIBfSLQUGVKSQ+rReD050TSQI0YAQnf1P7?=
 =?us-ascii?Q?5scVizZdvQiIGKlICI6NA3faDlUQwNgMxOZDfOZxnixwZXYtFuuaRYlTBcaL?=
 =?us-ascii?Q?BM+u/54M+SY0cRO032vhkDWkg6t2XUreLcnGhxvaJ3Izf8CCmo+YYDi3Pn5S?=
 =?us-ascii?Q?i1da2u5WNSTPb8lEfFdUflUw/6FJ5rUHlMOyZgU9BwsLKUkFK4N5U/6AUhaP?=
 =?us-ascii?Q?HGebnFrkxorFmddIdeoVFqwjpUE1F0g81vqr7hhg4FZZDWHsBaj326sFGSo0?=
 =?us-ascii?Q?oJ1qLzsZXNag7rayP+wHfXa7pTrLKXAoDgKeu4uuCPZSWjIAzUCtDl94A35U?=
 =?us-ascii?Q?JF4w9Nr5g7eyEQj5UXe9goSry/7Fb6eMPm7qP4PZWffwN9XcObKk/PZqjGIX?=
 =?us-ascii?Q?jDi610aqHh+iDTC3GswqPmP0Fkyf9unioTkSFkusbLD6eaoYVLhm9hvecEUL?=
 =?us-ascii?Q?TZ99Nkdsu1BCGUZHo8uGWiGUsvBp3ys8FGbNmSjzGimIVmsHM61EE8nFAIrR?=
 =?us-ascii?Q?pcaK0Qt8FF9awI4JomiwJQMaJvMKjR5ixYO3IxziRuXKYxLxBD5kK9LQuYW9?=
 =?us-ascii?Q?OqkyXBaHrfKOpDXQ+BI9mzj08oQ1wq7sEyZfG/aO8N7Asgp+KnwlkK9WEo4x?=
 =?us-ascii?Q?gnvHIn7r9RST7BDHqqfa4xcjRuNJzZHjMWo0aBdv7ggA88ZHS3EgkXPLDG8b?=
 =?us-ascii?Q?jA6+LsV9H4FqMdW9Xz5/FUzqs++Rkt+2ETl8FvI9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5ZznjIUyH+rBMVMSlm7umGFUb0oCF3V9zIFbcKr5OzxCTZyt6KeOl5OOrx2dJzp6PWmjUUxI/Wn9Nc5Oe9t3S3UzmGNrhSdjDkYlZh0Vkw741GKlOAyBPAoMtL8CBTUl7hO+9foCKuOtSJL2eY8wRro2gE3kEf4lcVwJeIv2g3jOzes3LM2epTavX98FBe1JBFKhnslsRQjtofwbIW5YFhhy/cOcn4wINi4UwziTZfnpB+ro3insi3rsVRuAZVRMhvEaZOZkXCR4oC9dy4mI59J/Xn2TVrwv8Q3VQKHnSd+CCpnQrx0S9rqveIW+uV5YiNMLYh4ssS9iSj3GNMYhoTVDUW/UGXtGRGGp/PboWWGHblMaLnFM/lnWtQm9EaCXttcXr4sqJGGV4voLYl/ATcw6SbcnhfVcjjCHNJh5A8Gf0Xj5I8L1lmOfJOdQ5H2/IXLLODW/FUImr0UZsoQb/G6ifu2wo/ExJ7laDi1Lw9PCZuiYrPcM8KEWWxe1eEnaJGkHTIi62Nh8nYyAs4Y5x1zejo80fGuBWzPBlmbKIXsjiovbsNgXGatZCDZ2bRgalIw9K+Qvs1AQZAC0uR1c3nFMifu+XFrhNgSj5GZ1lTk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac58c53-517d-400a-a9c1-08dcf85efe80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 21:16:46.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcV4FnH7tN+4iEOTheLn6l+EfGs9MovvtfHQdkYf7UjLaqKAHpBaDa28cVBYZXaX06JxR3bJWVSpYzqKysx1Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_16,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290160
X-Proofpoint-ORIG-GUID: 4jAFyiOtbpxgZBlSWLEpRlWkoeEqaH_P
X-Proofpoint-GUID: 4jAFyiOtbpxgZBlSWLEpRlWkoeEqaH_P

From: Eugene Loh <eugene.loh@oracle.com>

The chill() action is not yet supported, but it also is not needed
for the test.  Therefore, remove the chill() from the legacy test.

But we do not want to diminish test coverage.  Therefore, make a
copy of the test that keeps the chill (and annotates its XFAIL
more clearly).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../unittest/speculation/tst.zerosize-chill.d | 34 +++++++++++++++++++
 .../unittest/speculation/tst.zerosize-chill.r |  6 ++++
 test/unittest/speculation/tst.zerosize.d      |  7 +---
 test/unittest/speculation/tst.zerosize.r      |  1 -
 4 files changed, 41 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/speculation/tst.zerosize-chill.d
 create mode 100644 test/unittest/speculation/tst.zerosize-chill.r

diff --git a/test/unittest/speculation/tst.zerosize-chill.d b/test/unittest/speculation/tst.zerosize-chill.d
new file mode 100644
index 000000000..ac63bbfa6
--- /dev/null
+++ b/test/unittest/speculation/tst.zerosize-chill.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@xfail: dtv2, chill not implemented yet */
+
+#pragma D option destructive
+
+BEGIN
+{
+	self->spec = speculation();
+	speculate(self->spec);
+}
+
+BEGIN
+{
+	this->one = 1;
+	this->two = 2;
+	chill(1);
+	speculate(self->spec);
+}
+
+BEGIN
+{
+	speculate(self->spec);
+}
+
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/speculation/tst.zerosize-chill.r b/test/unittest/speculation/tst.zerosize-chill.r
new file mode 100644
index 000000000..4fe802e01
--- /dev/null
+++ b/test/unittest/speculation/tst.zerosize-chill.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/speculation/tst.zerosize-chill.d' matched 4 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
index 56c1fcea3..ec75381e4 100644
--- a/test/unittest/speculation/tst.zerosize.d
+++ b/test/unittest/speculation/tst.zerosize.d
@@ -1,14 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
-
-#pragma D option destructive
-
 BEGIN
 {
 	self->spec = speculation();
@@ -19,7 +15,6 @@ BEGIN
 {
 	this->one = 1;
 	this->two = 2;
-	chill(1);
 	speculate(self->spec);
 }
 
diff --git a/test/unittest/speculation/tst.zerosize.r b/test/unittest/speculation/tst.zerosize.r
index 7dfba9727..5ed9cb183 100644
--- a/test/unittest/speculation/tst.zerosize.r
+++ b/test/unittest/speculation/tst.zerosize.r
@@ -3,4 +3,3 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/speculation/tst.zerosize.d' matched 4 probes
-dtrace: allowing destructive actions
-- 
2.43.5

