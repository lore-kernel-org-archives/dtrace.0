Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4A16EB4C
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281510; cv=fail; b=cAUaTPZbNng9n3dYw7JX+ppi0/X6r6FJ/7Y+aPifgthnYBOAk+7vaWKpEY/tOzXtbHX06vJRo9DDMQNoOpPm9+FMPdfRLRMiShUE8JwK+VlJZFE9T0ilt72PKbMLN70/IX0Zk8Mx66P2/ZVMprKENCXrfV7B212FRHFQjxTFqUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281510; c=relaxed/simple;
	bh=Tgj+T6or7QgT/4oSFnAZ/rGSGejKKU56kISiPB4bLW4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cZbeG04njo3d5hAJE9KBbtOwqdh6T0fgu6KYreJmrNOSJ4byC66tEw1EGOjHnTPbEfb87IB9YailvqI7ExSv21Tw/37G4Gx+bucNVXmXCRj99OIWcoVPMexpeHIdMOlh2DLla6oWDoxrjk5WcNx7KxBXZ6dlWSX+iK9COjFAZVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b/cQoAmi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jyl0+Lmy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b/cQoAmi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jyl0+Lmy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfmY0006172
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mRNHfYAtFuS8ria2q8iu/LJ5DJvmtzghTF17fPVyo0U=; b=
	b/cQoAmiRUD7Pymp6S3SlabVf+xoTBiAtsHC3fx9ZyKogeNfXsLpRUma1fASTWmb
	CwFx+dEHDq1WykS2ALWbLu8AVNs9cqDWneB/hSYngdpT2o3mkMAmEz61eh5urBl7
	4bUpbUSnD3D6sP3HwFlzrA9jM4ugyuReI+wB/XECtxS4J49Xmi5PcalCD6w3DANG
	qIpk+B9umK2iJXz9GjhXLBvfV+QrEpo5tuetQjAbmoxU9wg9b4G98XgzQ5W1xL+C
	8SvMCDTdFDA8Q7V7bg5IfuHm4lqEiS95TDEJPLvoHAwFUN7ysJzK958VDMtw4VpN
	fAVEsAOa58B8IT9vyfevdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fw2sstv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIoexj027164
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:27 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjmuuq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omTlx+86UZggz5RrBKlhqzLB4ECtBM46pha72VOo7WBwEC0ZEQg74Q/2NlGXt5UD5iEYDgh5XDgAMS0MoW2Rx7gvhrEYhaybUHtaN7+Itl9nv0725V5rPafWgWjKZzwTcztndUdbeQxiROsjmcG0Rpi0eoncp6pKBb0enDqdyk9ZogIUdEAcjcahiZ6BfVmPsj5eCxR2hBDix0Ke8+7RxBiJh4gWt1nK4KGOuTM9MWVhK+96uoO8tnqCYWjfVZ0H8yVVsRtwdiDRVYtCY6ozo4/dt1ARdHvEB5eRWSLjNxtlzKUCN44HRHxAIGDTw2peABi/kEPDKnSOgNREaFP13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRNHfYAtFuS8ria2q8iu/LJ5DJvmtzghTF17fPVyo0U=;
 b=hwlFN2un9F6UlqbLK20Q2du4Vv4D8KcHAv9Ox+BQySYjTsiVESF+M/j6VlG0M1XZzbH/day/fJHWXIN5kgEROD8piXEcnfxvPhfddfkISkaOhpU4uEoUaurr7ooct17hoMVt6178DCok8Nj3uctKJ1BPXNA+J0O0sB72He4blabrwDV8WnvO6lEHgGIv/mB3stpOxiVIjSaJZWHVWQqAreW6cbZi+YSYCH6CP5ENXIpkiVmtHfdkMY5l/czaxkw0I8L4Ohol4WN/vpQcHdilFaavmNNR2U2nFVYb9r8pFrNHpCmKp7d35G8fZr49CSMyBixdQknLmURQD4T7k5ZBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRNHfYAtFuS8ria2q8iu/LJ5DJvmtzghTF17fPVyo0U=;
 b=jyl0+LmyKaNdpUxKE/lTR0sh1uftp0uJw6VUqDq6ccIJbix2FcDiFQXUy4qwWo2R54lhCqi9b9AYnCOWBDcVYdXcwDM0W5GInPv7PvJm6b7DrmHePQeUqQPpE6d6p7iF2Kz8o1GnBXVpwVkyTOmJvB+9LbrelDG0fX2Frb7aZuQ=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:24 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:24 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] error: add missing EDT_PRINT entry
Date: Fri, 18 Oct 2024 20:58:03 +0100
Message-ID: <20241018195808.270688-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 1096052f-188e-4f1f-4c78-08dcefaf39c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qunuk4MgQAgik6P1iyPTRgDfmmePoWTohbTGgruaZo/020fRR3I7AfqllAPb?=
 =?us-ascii?Q?ZDOjyFin8ZZtjj2B7bXsGHORuNuiGLSjLvfurPalRCsxE2NWFOqPI3ItfITv?=
 =?us-ascii?Q?vJvleX9cAqFLfc616oc/povki2e3rQ7KdS8mOLI3wqtjY9ckTVAUWEpUJa8h?=
 =?us-ascii?Q?+GxeRznM5XXy2myQsjheu1inl0Ae8rsRi5pxvab86Uyxf1oRoQx+MeAkWK3n?=
 =?us-ascii?Q?YIqZoNNoCGBw+faJC8US4VxJAKAlr3ixfnfoIanH2I43OIi1/hYZU4ndohGh?=
 =?us-ascii?Q?BoFU0boX5Ke/yLjr6/6iDAUDv1w/y9lLA3K7schptiPXf3F3kkIUYsPuvcmq?=
 =?us-ascii?Q?etOdOjEqa7tP/kQqlSpY1TRlQiaBfjhFk/5xqOncLt83TM8Dm16pNCQGf8PW?=
 =?us-ascii?Q?Xs5g8Sq24ouhZEl2BZK5d2viXErJRPsGbHIw24LPBuXAUDYG7m+h6OMOu99t?=
 =?us-ascii?Q?zlY9PqA91fxNks3tW+4hLcwhQhkJHOmMwt9DIJMkb5O73DF4qyUohtLF1tGQ?=
 =?us-ascii?Q?+qemeQzs16zstpd7YnQ403EL/sy9yX0t2XeEMEo16xoGOD+hofrG9Eii+ND/?=
 =?us-ascii?Q?y22looif7ULNHr1uZxarvIGLQN5mqZaQ6qQMTMVKkUbpPH/PZrX9KWytc+vc?=
 =?us-ascii?Q?IuyesZwNTJHfjEK+EtfYlBS9HpmSiQ8I6Dm9pzpmjcQ2P98UKF8R4yitgVYi?=
 =?us-ascii?Q?n9v+SKe/gOcwVNOOvs0q7aMduW6z4aG+Aqaj/uzXqJEjS4QeGte5FQSzZdAo?=
 =?us-ascii?Q?O7SqO7XR0y8mbO44Zr8iy00SgKxx/bmk+5EkDUoL58Cr0HJw2LQgTosK+m8J?=
 =?us-ascii?Q?TU92ymD+cRbzVS4+/cTN4adFcIb55sr27h16xXYbwVCCAAmsHR1BKCNJiHLK?=
 =?us-ascii?Q?T7jdiOJ3DkhucebyuqPdLccjmn/w3qzV+6qmbz659V0K5BoeZbSu+HUJV1kG?=
 =?us-ascii?Q?NKeZKW8TMi41gb2Cd0Frxz+/eAvukQtj1FtKS4+kI908owD6945AYtjHParj?=
 =?us-ascii?Q?HwOsNQTboyubd7dCY3HoE6NjiS2xAkeHpLV3BiWfXeWighPiXnPi+AvXzkbu?=
 =?us-ascii?Q?XW3BKawWfJqcL0FwvzSR3+DiITYRBc/v6o6uqHksrsDALTSmxusFsieVRQqJ?=
 =?us-ascii?Q?BA7UfvaS8PggqT7hHFjYSSR1TflEmILEOwA/ZORnkRgb6UzkjJ8jFuQSiycE?=
 =?us-ascii?Q?o0baPPvMny6MpyStWZRURvUPnWCzW0okzqrMCqMgd5zp8rlvYBgNMG42g54M?=
 =?us-ascii?Q?tspBphUoaaMK9kVZB1UwmqEqGgc+1muhwm/n2wFMyEpN/9qH+jjeY1EpFWOa?=
 =?us-ascii?Q?peKzi1b2fuX17xJAh2pYD+ED?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MDfdeG0U3loFQ/gx2V4owCdMMfKfVZB0qBLKBmo/TtyJTEHImRYdNWsLvPls?=
 =?us-ascii?Q?0iIQJ26/SWhZBKp1QT5kSxpXC1utE2rMlVQt58QKbL8iTY6v14e13vXuB3M3?=
 =?us-ascii?Q?Das8DYzrU40sY9S3tiMTdum3XK9K4Bv+90nysIUapEpVeUPMuyxjnsSHEMms?=
 =?us-ascii?Q?ikPqlINaurfWtUt+J/+ri/pxN3n3nLTjfzgN7weGO/6DpDRx42cGzdosOR9p?=
 =?us-ascii?Q?d4+hFtXcgjUjmvv7OyOwwbQbRpH7oqwk2gkutC7qWYhPNbAa/KWYJhmHqeTT?=
 =?us-ascii?Q?4KQNtY7ODLLHaQxXlscFyzh+nRR+YRib9dGNWtPp82mlauzUtfsyVOq/lKvp?=
 =?us-ascii?Q?DHrAikaijXqW6saBftY1suxaI2N+CybVA9H66W0sW152FlivLDba3d5EpCwW?=
 =?us-ascii?Q?74PlelMl/1Es2anNgz7UZfZJgq5CEhMwcmSGDNoFtrn8V+5aAxJkC1ID84c7?=
 =?us-ascii?Q?vDgUjaddlZ4Y9AONe5eCFtTwUEf3cKrV3XnLwBaESH06U4hGRHw3cQDBEgAH?=
 =?us-ascii?Q?aHHgWswDWOseWG732e1pxoNXQ5S6YVth7ftDKiyM2AJuMlYOQDZNEuHuJ2X0?=
 =?us-ascii?Q?F5JhlS9fKlgitNT17huCpVf7CtvSVR2JQaOMYPr9ux76OSNCuOQ8mwFBFb+6?=
 =?us-ascii?Q?7tyLQ6+qkmUwKvI3NY1pBCTRx0GQcnGZ+ExWTNqAlbAnDwXw8d0+L68nHRS8?=
 =?us-ascii?Q?VTcpqRirlNxnziUJ1/XRXIR3TTtXqZqN0On8X5HRmQWn+SZ1SL6V9NUv25vE?=
 =?us-ascii?Q?GrXKvBUZevqmpAIruW9UhaS2jykSGxHxwdLuPcmN0lg2ZSnYaZ3vgzOpxmJn?=
 =?us-ascii?Q?iyFm3/ver6XRrTB86lvE1MOYiqKUCR1URiB+qQbJ0QTX0N/g79p5OP/H+7ev?=
 =?us-ascii?Q?8gQiOa+idGnrzkKQBJ0ah/lzFH82WSDoR8aBeXoBeFhv5TaQLGmgCV2jEyCW?=
 =?us-ascii?Q?SuVdaoiZ8UPaQ0kY7AADwNi5JzZUTjd6AlOkEcGLSKe8TQQw3Sx4eSVV33gT?=
 =?us-ascii?Q?wv6Pttxe85b8ztDJ1ueR1WSv6Fn1xZL/ZTF7LykdXa/2IT91w6ZEwJHj5OmD?=
 =?us-ascii?Q?dJ6OvewgVtmn5IVVuaifSWyHlq3slcWfI6VXyaVXSBQxHtH9RZB4W8HOB1Ef?=
 =?us-ascii?Q?1KWxwoNIXhvR7Qy2CF+oOwkv5r4B6kGxdX16sGnRnDpXWlcWHTYgCrgXgEqo?=
 =?us-ascii?Q?xtB6zeFs/G57o2nZKgSx9rWNRj9ejdepJdr8cnG5yBzkha4gAuOss+8ACPKs?=
 =?us-ascii?Q?Jf85GUsTNlcOdhfvdiw27cVKwSWz1/ybqvuMfMjoJbAE9NipsTURuj6cCKPB?=
 =?us-ascii?Q?2e0Ojp6dpVSvyTGzNz384Fe4XAY2Cl/E+LjE2LmgYvM8yakEyjdU7DBQ1zFs?=
 =?us-ascii?Q?3RYqZuvXlsqcrrLcZ+6IlpIQ5Pq9Di4Ri006BHFasPMot1nCKO7sRbnGdIKw?=
 =?us-ascii?Q?7mOM48dqDf+c3ybz8Ny33tRbZiQBwyoWBirqOCH/y2zfj2g8e90KEHw/mbjH?=
 =?us-ascii?Q?srUmrTPdvbPQRHfzm0SwA7qXALltumiSajWNWJSpw6lsR5HPbXEqQJK2R3ib?=
 =?us-ascii?Q?w3uuKjZ+zljwe/5IX4T3kupIzhlI5hJ47pEo93C487euNvwsqm2H1LUtiOB3?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3VxlhPiUydUuXqpuLsrajdSLumBtv+OhDvpl2V7QbOeYygjRaZzPmxdzcuh5pIfAHS/wzajTGRlplYyXPBOHZ7P3aA6WnqhkZwfopBr8Onm4cXOaWLTBE0uuE6l7lrics1Ji3Ff9ZI5ZSMG/V/hmMigWVNgkwA6BaQyC0a6j+8bpJ87CEqgprl51q7wto6oBR6GFJnQY7wNe3ygiK/nJbirVhUcrF2xj1/reRF9FlhmrIIJ6xA7RtFabt1uZC6u4v/LrrdCR+1A/wefNIx5XKiRzA+nY7/nUuVhQ/5h3Elc4YBmaNhTuh9UxRYdA6/xCPlmsY6nhfSYzXJHQ1SswTRdwSA1zHGkDTmqI5xjovkt4ZwAESDWW76JInS8MoZFTP+l8ND7YVSKvhz6woE4G0HuDSn0jUmL6B1UfjkUi6fjX3Ja18c/ZvVY2Zbt4SSn+yTMtHXfIvZ9mWJFGUvbqp6rnwQ8HCzklykrnPRJwt8FEm0/MAOeaeDLNXKiwDtuf6GQOyHJt7crcfMv5R6KJ77v4YehxPRxh3c9hfH7gBdbmZlMjcI03gtV3GfbRnAB1bUXn4YrAC0LyWvOZ47kS0GITfJJXJbhy1VKWSBfzY20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1096052f-188e-4f1f-4c78-08dcefaf39c5
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:24.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sLm7SIkl9jovHV8yfV8WwwXevvpD3R23OrtdkPPCrcNfRyKazmuugew185vMWh+c+PqujJdBARXVOTK+g56ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180127
X-Proofpoint-GUID: 3SPlZNOkLN_acFcoIhETzOR5xAnOSKfY
X-Proofpoint-ORIG-GUID: 3SPlZNOkLN_acFcoIhETzOR5xAnOSKfY

The lack of this made it impossible to print out the last error
in the list (which is EDT_PRINT itself).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_error.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 82e114a5b292..213f0d9e1385 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -97,7 +97,8 @@ static const struct {
 	{ EDT_OBJIO, "Cannot read object file or modules.dep" },
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
-	{ EDT_PCAP, "Missing or corrupt pcap() record" }
+	{ EDT_PCAP, "Missing or corrupt pcap() record" },
+	{ EDT_PRINT, "Missing or corrupt print() record" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
-- 
2.46.0.278.g36e3a12567

