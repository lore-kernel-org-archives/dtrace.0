Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA441DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150309; cv=fail; b=XTYOaCZjlJYE7mUiT9EmOOz/svfVDZtxRzJiTtAHket/C+eqXR0ErRz0FAQwYX/of3BEFj27k8Do+TkfHwllregghQhk+PK6ZDxjKfV+LnWYFQ2wXWxwv75h/lESkymSqiTF6ays+axu1j5RTfe7R50oS6As6Umpc7YwhTStLUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150309; c=relaxed/simple;
	bh=PGKI8NaW8lCihBHshPVRTFuBio9Cxm/eMyLjhRrU/X8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecxindqEENPppzZ79pd4D73G49Dk5Ow3Qphv9BS5ENU6M3C7h03/1Itx6TeKIVD3wrLQxt+XbubLITVpHjWmWiYDL5/ZlAoVKrLNoceE/4HoZExsNLP85U5hVNQT9065PvRuGIk3ukVmniFJuXSsqDYS7Egbt+PTCguwTTW7CT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W9Lfpgv/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S/E9CUJg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W9Lfpgv/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S/E9CUJg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtk4U032609;
	Mon, 28 Oct 2024 21:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hGJUKYYXxtSOfp8IkITMpj4eNkfzXEjVGxGXgoEdY4U=; b=
	W9Lfpgv/tE7+B/Xs7zJWikPhFBOzA0/jRsnRXOuAYJIcsfvyp+Pyarsqp1w6B/u2
	X0qrxHk54ipCPDQkmEfR6bcAyOY6Q6M9TvkZngRfLgp0VhF2EbUq1kBWaQBx43rT
	r+t9Fjf0aAdnuqkZJLA4y/1XHPWh6R6sksrmwuyPb2aGee2DcUNps4wZZi5pClE7
	Hax3n097n54PGhJvQZzpHkBs7aG2zkTvLwutrMpD2jquMAwqZfa5RBSiH7YsiMJB
	7KiMNSAuBPfqwek4kiEhTpYqHrqkobLRvPhY3tjYWEmNZEyK8ETXaFZGCB2gk9qB
	TjeM3ei6NpmjI0H1B0FFfw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1uy5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKCwHv010127;
	Mon, 28 Oct 2024 21:18:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8vu56e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUfZjhXyMd/JyE8yMo/4HIAyqgwezcN7CiS8v397wvZUjiTvG3HpvupSmpsx2m6PcXfYs3ZeZHHVlb3/2QtfZJZKlgprlZQk57Bl+RHASZMfQu/vcAhn+mk+a4UAkBAdTa+EPKLUKLmIp1Mbsi1HypOi3rrzJ67AlWYaYorCYPTHOd0bKFw+7OjqPFQgLNYIbr645l6OKKpFZjL2JjTylVWyXvKdTPJGu04S9Jf5EjjP12VJ0IZJdjIdGItib25MXCjbBStK3tdxQW1oGy1gyqVzy3VPCuxdr/t6+3oDwJ66Lvp7RiZ+0bmIfrs4S1BV2rGRWNsEVmARj1jR9RYBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGJUKYYXxtSOfp8IkITMpj4eNkfzXEjVGxGXgoEdY4U=;
 b=ETurV6jblSVJJFq4E7eGJBgoX9oRXF5AFIBusswBc3itfpV4c8DU2sh6iUDKw8wgAvHV5ZbTgCrBnRhdq/sg44GWRJ7oKCbARMYdhiycthUJ8OpWplXoCmWewwWhHewuIHOHJZAFpfdy6X3Cwt3CeSEjhNUmL3zAU1uvaCFfsTL4zOHrEZUrQpCuMBj66DE39rV8eAcNqZJGGYlCAQeypIZXtfLPupk+z9vAPEUonbaFCFh/P/93Xps9A+Rni+CmZDhg5vuQq1lCrv5eSK+wEC1Lcmx7DwHnfEA6cJ9C7j7brxdDo2vG4KAQN0hEGkojv3WkcTrTnGupgtkDGwgLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGJUKYYXxtSOfp8IkITMpj4eNkfzXEjVGxGXgoEdY4U=;
 b=S/E9CUJgWuExYcjqiPTswqtfQMu5kxVn7oAg9GCc929eNz+egMfrMagr54iTsUm8rIc+b1qUfU6ASMPdmOI1iWrx//z/Ay7GpaQJwFsCEehc59punWikRTd4DGPSSJ3pwjmhxRtYNHeaHwytjd6bwYyoqgrMH8I/6Ydpq0/5M3Q=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:19 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 06/14] configure: fix dreadful behaviour of MANDIR / --mandir
Date: Mon, 28 Oct 2024 21:17:55 +0000
Message-ID: <20241028211803.458685-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: e09c9713-2761-43a6-edb1-08dcf7960b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mAr3zsljDeMn/Ild0GB7RdWCE4Gin0BU03qQOy9byt426dhD8Xnu8yHCrc+h?=
 =?us-ascii?Q?j2j8/gN6q4y/rQlgWWy9X+KAh9/kiKMJp/acwmFjjknG1d/aVBqGPZZykHgW?=
 =?us-ascii?Q?KmOv/NhTym3nOv8fEfUtblVf9n3qkiH87bBaJq5zLjefVcMElWvRHDPZ4kQV?=
 =?us-ascii?Q?mTGUJHDF2Iy7vNYNvXpviRjIUoon7ZuaQeXVcIDdE6OtYgnAcMYjQR3Wrf3H?=
 =?us-ascii?Q?yy+xzRW6x3xFOP2tH0QpDm2DM3gIQyxF1pOoW9MfOZJ4bUOuOHnUa+4WaIVi?=
 =?us-ascii?Q?ndpA5RX3Fwz7z1Ihn3Im1ZfrAa3IC+4UI7JedFF3RMYq5EBVv6+4sUDqYoh0?=
 =?us-ascii?Q?VNoJ+RSzX1BZvlk1O/pV9YcAfZ/3o/eNju+T7zx5fZAqO+mZqQfyrbsAosES?=
 =?us-ascii?Q?BkM3u7IK6Wi5rRoFaKBnIp40t3FypV8ziN9+XYohre0I90rRrDArsMEl6012?=
 =?us-ascii?Q?lAbP1EGrZ8wX06XgaNGGPoKx1JHZA42Baf5EFJOaF9LcR0Uvn5yXlJbeCGOW?=
 =?us-ascii?Q?5qYGneY+o7wIJdN2JdH65KZuSdEGHYxtuUavlzbShXGYw2pK9GgL904JejQ0?=
 =?us-ascii?Q?ry+PB/WvXO5LKdOCr+Ou7SSfWy0+kgfw7Qn3kEfUH7m80JoHGqI8p+H+QIEX?=
 =?us-ascii?Q?3JpshbPMAh8bAVaQ88nuodsxJSx9xS68X7jj8SL3M8+ObaJIZd5n5mmeoW+t?=
 =?us-ascii?Q?9lT6hnsUIxS7fpJ5q0ncrLdxB1fFXLz3z5AtgUbwltHRshjpF6HYJUUfpWks?=
 =?us-ascii?Q?OFpjP2wLriSk4aFvaKCwSbKLHavAFFVqDbKJ78kW9u7eFxGGYKNoVrTG+l/o?=
 =?us-ascii?Q?PX/LpxVsVH4NFczCCUAXUS+L2Ta7SRWutsUWWF7fUV7/QRX23UTrbDRICqFE?=
 =?us-ascii?Q?NqEZGvDKFaxjjbjFOPWE5QRxT/aafsrwDqWbquj7FN4LZbI/rfMgbRuHEnrg?=
 =?us-ascii?Q?j2+KMKSaaNgV0u6oPmwpbmmRbVYI6M9XXZZ4SNsmjw+QryO/ypBN9ZhvsUMC?=
 =?us-ascii?Q?6ShGIY3WC+P5pjVtEGf36lhtoOipEoZkKRAV8Y2QLSBYBA97cfCygRjCSgYs?=
 =?us-ascii?Q?6nFv4k4zN+N8hpt0TQUp+fMTRzzevxkMtDtxlcsxcv3/SdpFtAF5qDKO6f9c?=
 =?us-ascii?Q?kmZ4pk69v0UND/dLmxv8zyG6wb44fvhUJvc9zmJUQLCy1o0xN6IUC2XoIDPW?=
 =?us-ascii?Q?bvF7WRZw/yEHCjR/QJOu7rCIHiyMJ/J8LDO239G+qk8rWbLI72BU9MYSpblf?=
 =?us-ascii?Q?WsXSyqr0AfUPRUkf6aGj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t2ITe45UURmfJzTbPIuF1Tm37M7N9YFuMSBw213sVbQp0a9FdYkTYjDBAcNN?=
 =?us-ascii?Q?9oQ22F72ABbn2tN/Vca9/7b+VIA3viLwapzzDfpMHHn6PLxb+JiDVb/nPBui?=
 =?us-ascii?Q?evBK2J7cU9FYq1m9ue55YVv14ANIP4yC6vga3BhITytACP1ULiXYA9ZKTXjs?=
 =?us-ascii?Q?1rQnc6GEtNLJdgfD9OpqtSaQ9goiM8FZdDFrb5QJDOWyML7Gflh8JjM4GkYP?=
 =?us-ascii?Q?iC29DHyY7yahd1TD/yR8eYdZXgowUGE2KueMjJvfrt+bN/wt/GOfXV1Vz7ij?=
 =?us-ascii?Q?V9HpeByXsiNXd6oAao6XxWPgN4abCE1UUkG7GUXcOIoqhJLFXfeN3Bovic5H?=
 =?us-ascii?Q?Y1fLEwnyJv7U5b/izkru6LIWLAf2cKhZ2hWlMAXWsKMf3cWRG1Dp5C0p5NZo?=
 =?us-ascii?Q?gY3fLH7/kYASQUaJlJjFRrsv9a7ZXDEZcpd5zDl2ukU4wo+AKehpY7NVaZ3O?=
 =?us-ascii?Q?Wj3Ku5+DGepLWOwfiC1xhMHz6j7DtfOsUWowcKtBVHnv4V7VT4uR/2l10qnc?=
 =?us-ascii?Q?u+3CE0TZGkX2LJgtfzhEMyiyhjv46g0k54RTPtQsWlE/DKYeJKA+D1GQ+Qst?=
 =?us-ascii?Q?2TfyhFvO48+707+G7d1WIo24gw8LjgWz/WV19kGstkJ5Mbkg27E03j2buglh?=
 =?us-ascii?Q?ANFUJsvzTXOuG4U+h4FKXEhMhoZNh533Tcn0/+gz0ylOKCWbATtgbOCazQJu?=
 =?us-ascii?Q?US3rHSNw4EY4aW38GIeD2qNrfSOyz/PgeTywt2yqRIMqZpn3sExchacFR/0m?=
 =?us-ascii?Q?bwzAFrbCnm5C+BQ76PI8WipbYl7AsREdHoJm4qbkkDAyGgq4/KR2BtOUps+i?=
 =?us-ascii?Q?xN5F+w/lIXpp3YdjmyQGFQFsQl1rg+ClDKEAe75COkAgFUyqxkJpUHYPj35B?=
 =?us-ascii?Q?7ewvu2hyHj+8sphtpL8DE9tslVkAJQ8sF3Tr6HisKrKY2o4iTEbQyF1gTcKC?=
 =?us-ascii?Q?YtF4tdaAhLJuLGuDuYQgBxjl2sTGzQHetNonIEKm27lBdDdkwzVTcjbwzJBT?=
 =?us-ascii?Q?ej/rgj/6uUPE568X4UoX0sArCb/HbIPD1zNd5OwR8+HBB6VRW3d2RkiNXMVf?=
 =?us-ascii?Q?QmiwyLBjP6FNw+Ps4TTc4iOyjfjKQ29K4GaQ74fFfSstC0NfhTrCVzE7nqS3?=
 =?us-ascii?Q?mu1jhtcidRuCtWeY27B+QY1Ec0ul8ak719vpWDeKw0lO9dB5tiYnSlzlu/Vl?=
 =?us-ascii?Q?reJUG/P14tUZTZ6bZUb+JvhHbUcA0MTyag2oSjSLZfJDcakXFEHsK9cxqjt3?=
 =?us-ascii?Q?tsGFfQ5gTAB3wndtZ+x0BaYjzG1GCHbB340czFLz/9zk9I5lLuqmwSw2WHqk?=
 =?us-ascii?Q?0tvR2+0bcUa1v7HFKeA07bJllEneYV8uJJ0/rl1DrVl3nnwyGb1bvcOoBIrm?=
 =?us-ascii?Q?t7g0iZEAPOhLtNgW4M8BVQWoCGp5jKwxll7RknqSkLuXhPQz4u2fbStQG2mX?=
 =?us-ascii?Q?SPjIiirKp6cr+l6ZojeCuhSZc/33PUVwm6AC7dGDFSfZNXya72418l4BWp5T?=
 =?us-ascii?Q?kNfbOsM1fQgMiw9vA08PWVPVna/cq8R2OB15JCIcBNvo+BmSLh4YuTV5A3Jf?=
 =?us-ascii?Q?d7B1/9xyQj5mkkCfJoXTxOtEu0/XaYS8IztAFw9qFCLWOw04WJ+FNyEBfT1J?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6+VL4tfc5LQDtRmRjdxF/LCnX2Z8ZTnmSpiOaYU8sO2U1cmkYPsqLZauyiz3iVC2n6pQY3Q3703scckKpRQJrMpPz6ITD1J60a5v9VTmbj1vC7L3KEz8ubumxb4H/eX7kK/htRMIU5OVflQjtE+6qSUHgVaRXaKFASFRgLMbRKHm2vYUUOJTM08MtUpzdGvsg/pm1jE/PWR1SUQLBhX4xDRof5tSbXTxAK8idhI8VQhz0WUBlkrlDIayXM80e3grKoxvbm3DEZQVQwByPdsCMXG6zpwG0+oCyHhN++artEb9qNivPp5WMy4RBwXNgsBah4J/ihR8TuZsE5nTPkCbo4vIKaDq41xTqQI3BzgiPw7YZYqbRyfGpAT2eisU/2wt61SV88mtiCAssWRLh+ysQ5YCHuNoIgk/KCdnEk15du94aqmgJAkg5INv75A39K8/ATE3EF1vb6oHFanIFzJt3JYBIrC6lO6t0p837+IzaePxhXkbMBrPX0k1tVXjOfw8wjtuYlh/RAUIkcAuPdYLNCHUcJCtlfx5MX9gU/VaOFULBArYudJCJhj1vQ73AbUpEUyo5b1OnHD5f60Ra62X1Bh/VTyiCf+5+Z6iRL5cq/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09c9713-2761-43a6-edb1-08dcf7960b88
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:19.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRZeA8hpWkjwvfFLd0IvjvN2Iktb0JaIAuCv+d8ADhQUmy5GfTowySwrLkeQt13sn9JPB3dtgdok9L1HXRleOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: JfqzTy64-NSf-y3GQPZJfl6zxveKwRu2
X-Proofpoint-ORIG-GUID: JfqzTy64-NSf-y3GQPZJfl6zxveKwRu2

This should obviously refer to the top-level mandir, i.e. PREFIX/share/man,
not PREFIX/share/man/man8!  Literally no package ever does that, I don't
know what I was thinking...

Bug: https://github.com/oracle/dtrace-utils/issues/106
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 2 +-
 cmd/Build   | 2 +-
 configure   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index cbf27b6be111..d1e18bb1bbe6 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -96,7 +96,7 @@ INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
 INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
 DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
-MANDIR = $(prefix)/share/man/man8
+MANDIR = $(prefix)/share/man
 INSTMANDIR = $(DESTDIR)$(MANDIR)
 PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
diff --git a/cmd/Build b/cmd/Build
index 68800fbeb5fc..38a538c1e3c9 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -55,4 +55,4 @@ install::
 	$(call describe-install-target,$(INSTSBINDIR),dtrace)
 	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTMANDIR),dtrace.8)
-	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)
+	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)/man8
diff --git a/configure b/configure
index 3237f9d23918..003c283d8568 100755
--- a/configure
+++ b/configure
@@ -58,7 +58,7 @@ Installation paths:
 --bindir=PREFIX/sbin				Binary directory
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
---mandir=PREFIX/share/man/man8			Manpage directory
+--mandir=PREFIX/share/man			Manpage directory
 --pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
-- 
2.46.0.278.g36e3a12567

