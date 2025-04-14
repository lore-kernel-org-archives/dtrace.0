Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A731C1F12
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662010; cv=fail; b=pniJuGNkcSxScnoHEZUA1MolBWuU6OQxs7H/RRoLkUR48aWK7cgGSTzm8Yf5/ceKySILTM/X2Ty6KU+GkHeQOhNNOxpYL/msl7qHMnXK/VVMDEKVXuaycxUpOMFT+Yi6WhT2vASJl6/SsdMz9Pf/xw+vgfyOK0Tbaj2ksHcERJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662010; c=relaxed/simple;
	bh=XRGB/f1DR7viQ1gYZpUEN0ZV11x6sgTR0RrXglWk3dA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tiROnxG+859RAyZ0KzVZoyp35Ccq0kS46ciXOwI4CiC3Hq8lTXlMMVOjsaWvy1yxFyxReuFqCZPYDLFSh2wQh340IfH7jU5+XRPAKsXIuv6h065gcOzvGICKL9g5Npl6VOibsEuinIk65f5g44kYgKmAud9gGVFzRWXTEYYhqpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cnruecaO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f6qXT00n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cnruecaO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f6qXT00n"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EIq154019839
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=cBL14l/F4EvXJQwVhc
	s4XFwwehxX5sB0DShVV7atKxY=; b=cnruecaOoRkbdbarXRIKdr8MAhiY+3qP29
	Wg4d2teBJyHAGFZbBj21XCibstDxcEluuYDBauV4PnrK/zdtiAcYrOUjAE8iFCpW
	pvw2+VqzbIOAdIY2dOuNVM0eAfue/izNGu6D7UsLEVVmlKv2kO8ZSXYMVyiguaFM
	nl3LCbSDd5WGllFjxnjpJiXOZorWE6MHf6ImCTuKhifLVacsFfEmWR6w5tgtvle4
	buKKC07E763H1qUHcbn2adcRUMPh4IFsMV+cZP9jku4HuYpepjKeJQFv5HpcGze9
	dFmAkWqsD02g8Mtz/GAAnExiFFzumJzwXS3JMf3EeoMxP+0O2iKQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w865g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJWNA0008608
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:05 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2p14jq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBueeN8+n3xHW/Hz5CJM+AUTJI2diq+EB7i6NwYanNC6sdNmDrwpXe2X3qzz3ACqIXzYpm/kDdpYN4TS8EjpWUyrI5Nrnoqen/8PJu4DZiknS0SBWnNIuDK16irIVC9ceh8W08LPBeGukz1285ImP8q4KpBY0YE3Atbo1XiZ5PQ9tSQSr8fGmvh4U/NkeO3XX/yOLyv/Rvkymbc3iKeOZNpM1sTNnD5FsQa1G+oJu/R6iWM1TpjM/JOi0hkrXUOR2i+dfxpnUBSty4XxrqnxAFzQQPk8iTpU82Z6Xs41TPJp7lkW7zPr4vG9YPPNfFZUxpGdTdwI0tm1UnVkTH8/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBL14l/F4EvXJQwVhcs4XFwwehxX5sB0DShVV7atKxY=;
 b=sYo8b9IWn4OPdKzKxolxOngejbgxmQvKRTZswex/bHd33oP7kNxOndhZXuGmZuQqlr51E+nMO49xI6F0qrYOKNCmmS8S0K9IBJYylhfXfy8hw9OT8w4azGn/okWRjh2+Tgtdlx59hKMwbPL0dGFeGBC6RjJEd2KrdThHm3gAttf90a+lqAB1ViP6/XS0MpqY21CEuq9gEmZ7f7TfPtopZqdPJkW4/ypmjoTV0BC3xVB83msjuWhrD5uXL8SFsEBe/zoWx05wouVgQCgJqXfjI6eqwoX4JLarZsof30HG0Kl2tJVf14jSHVMWLWgU98YVBZpVrcMYFQfzXhtXvb63mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBL14l/F4EvXJQwVhcs4XFwwehxX5sB0DShVV7atKxY=;
 b=f6qXT00nMyVxK4iD8nB7k4eN+dp9Ss4tSq1FeGVvmUwHoeA5z/GYB2D56sI+V6ePypQ0LkejrBnYXK6sQyifzyZufggxK3xrv+jgAWrtsV+05RbqzGCT5pw+wo9nutPWv9OR2xe9M0/5nKCY0O6ywcTZVc9tw3WXRv1MOmUzG9E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4124.namprd10.prod.outlook.com (2603:10b6:5:218::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 20:20:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Mon, 14 Apr 2025
 20:20:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] test: Skip pid-0 tests on oversubscribed systems
Date: Mon, 14 Apr 2025 16:19:59 -0400
Message-Id: <20250414201959.31327-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250414201959.31327-1-eugene.loh@oracle.com>
References: <20250414201959.31327-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7316d0-e13e-401c-9c2b-08dd7b91bce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WjUIUDcNvR55lZ3I2ebD6TRwP82MdjqFiYBiJjj78STD3K8NUBzh8NykjGv8?=
 =?us-ascii?Q?o2tuPRt+7ydZNDVPHauIPkp0NPMoHKlWdB+4nYxaYsTOwxLT24Nuc8wyRxMn?=
 =?us-ascii?Q?/9BWiziG3hRWEXILYJd/ST16c18LcDWkb89Ijcm42HgU2dgV8VbTPNzpFlLW?=
 =?us-ascii?Q?enrgzlawCdKG+X0mEBcq+zuS3h7Mg1nHXTpVfLS14nXcbQSjetOw+zQA2oTv?=
 =?us-ascii?Q?UXgUbsL7rxYTnH/UDcHJ42n5FELeImRdW3NxEZiZuMKqgxtM+qGaDcAv5Gcy?=
 =?us-ascii?Q?aVbFMlEj8DYPnJY9YaJ8REtr86GNp+EZmo0c/e7vyidrDh5rb0AZpPy9KcHz?=
 =?us-ascii?Q?MuWSh1uugiCEqdqWdyBZ120vrYH8Mucup4JnGMyAF1EJuiHxnp+Os3g/bHHg?=
 =?us-ascii?Q?Qk+KQrie3aQaL0hCaT7GDBnLk3bBjNE6+taIUShjh0ba8TlZmKTmALyTIbvq?=
 =?us-ascii?Q?az089wO320YHQbU1d/25Ui74dlqQvgQfQBEaBtSVbPdngZ2eh8/JN5D/CEsP?=
 =?us-ascii?Q?lfA1/hfz+qXSuxGXEUsCC0d9xfxhRdsysNOF+MrM7as5/qisZXC+1FT9qrmC?=
 =?us-ascii?Q?3FzgsIOP5r1VqPMwPXv8dvfrSIONwmLyKMET+IvvD3t1/zUWkyRlNnBBaGU2?=
 =?us-ascii?Q?O2rgo8T6iP51G5hp2AzH83vVhwxm91Kgr0XNCKFPwJ5fqu+flISidsc/9dY5?=
 =?us-ascii?Q?LWHXuEdhImfnQi+RU1ev79XwsF+tVE9K7Y3pmiugipuF9QNzTV5puIUOsAUb?=
 =?us-ascii?Q?we9J8Z6GhacylW7YC9Sk38elKHTjMglUcRSOqaDtiKpnKEBQXOXE5VDFUal/?=
 =?us-ascii?Q?70sb6QjrXqy4iCCdc8f0dJNwV0gxC2IIOw4D38Q6Wbl8ht8sNUgXo1FXIUwO?=
 =?us-ascii?Q?n7vciaESvWYoJxH2zeblZxyFI5HjRllYGxt3xGqmDSINZLmb12dSjSZus2Dh?=
 =?us-ascii?Q?Tp4HRfJQ/RWyz9NVdQ84DBLy0LsV8CIRd9aS77FiqPRgt6iIm2hu+9vbtn5+?=
 =?us-ascii?Q?ONI7+w6xzl8qgALcQI0nLPGqzWJMuBY6IMvvv7Ym8qPm3ENWIGlPji2zYe92?=
 =?us-ascii?Q?8UP1rhlDWzAcJHhjR1rbzdowmLQkwOrQUKplgfy7fSdTExmH5K1TLYMWQV8a?=
 =?us-ascii?Q?HJtDGs9F/YIB2Su2FrHlJK2ssxFIaLfJ+aabQpq5IdNK94vMHAYIRZZ7NoYm?=
 =?us-ascii?Q?mFY5IqmaehP/DaTH64Qwv2Y/CqHIJnOLZRdFLQ/18P3vVp/Aq910IP3/w/lO?=
 =?us-ascii?Q?FFXMkYgOQ5IC4mquRX3EXOeq2NWaQx3ElaT4l7kvF9mnTuddvFb2S6llwKx9?=
 =?us-ascii?Q?zcBBU4NP2bqN6q+QNcs1hj33Mja+WkAEeag7RD8xiR/enjyR5FJqlTEDPx52?=
 =?us-ascii?Q?maOXgZZdIbT5bBwbhQzmcv2Fit5Va0j/KOKCyIcvbmdwlha1+ynnNjgkD+P3?=
 =?us-ascii?Q?pNliQJb2AEg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a842dMBSqlL3tqo0p9mWWCq+SZAU47A0m1iPjGtMBTQfh5Dk+zNBFbeUPc2w?=
 =?us-ascii?Q?/VMuMS/KbAryneA4lkWmuNeSQRcRrOlpn/iDQLQJImPCuYcwjfRfn++Fgnqt?=
 =?us-ascii?Q?+zmY3eudhGcxg+0VVVb3UjXcdnu9If6Ffug8jXcrOT0XrAR0Gy7/xK1u+jqj?=
 =?us-ascii?Q?uXycWmcswoQN2ez8WSl9st8vV+27q0jCDdUC4kOT7qCajlqxjfGEv4+S/6fz?=
 =?us-ascii?Q?QtSHGafOZIBBTOd3gKpHoSBMo0J1TvA2dTqO7bBuWkRiYjMwSHZRsxfyprcl?=
 =?us-ascii?Q?FZDsZhL4Db7egr0BtUGiACRxbxifUnGfCdvg2Bc1U0vIsVsFyDf8lWyaBkeR?=
 =?us-ascii?Q?ismiZtbz1aZ3NPnj3G6q4uavOWBuLKguctqLrKcM98Kl2gkwur4MsFQ9ZDfn?=
 =?us-ascii?Q?YdNsJDEWMF9Q/sM1Wb2jygTXH2+sy/HlYb2URtBGGZvzpbhhmrEktuY9JmGK?=
 =?us-ascii?Q?HplXvzj75x1D/3lEHhc1q+QzC67zd6INL30fG0y0ytzbwFfpvOWVLSMbkd2z?=
 =?us-ascii?Q?p79YLe439kCxNsi272FpfsU4sEWpbe/d+BhdRI/19Q+SMqWwj98y7cBhVDKM?=
 =?us-ascii?Q?TfeeOw3KqTI8zK6Xh1n15M007Q6tf3yW5+7eOTqRgCX8fuBGYjKlg7iKZqIH?=
 =?us-ascii?Q?4Zlluh0HB+9FqBg/vJK8bkuTPfOyZBOvjyM9UdcZQKxWH8SxHzChSt7EB3sI?=
 =?us-ascii?Q?7FSpCeKlRWvNW1ULy1TYvQu8qh+nUtO2/6Iyvxy5MBhHeETTNRpb3F3w8tJZ?=
 =?us-ascii?Q?0f8PlMW3b+4ydx3KCZYqvLTNWKLXaeIgWIxfOWLtB+Lf7N79TkhQH9jPAnxZ?=
 =?us-ascii?Q?8p0VG4L6VFTyp9Ez1tGhd47dz36bzCtqYja5+VaMocAGy1SJc1l6YgiT+fvW?=
 =?us-ascii?Q?gNIVaCpcdzern8CyvquyUiAX2BloL5sj6K0qSbSlu93tmTWsYb4uyLHAeExN?=
 =?us-ascii?Q?PVsBmpCXm6DvGtVwKgLOh7SGE9gFOZEMmvMa9HpO0JIJPYpxHpRTtAsW3ZA+?=
 =?us-ascii?Q?d7ZPM9Jw+TR9A1glww39dWr89CFGXTQUaY165DuBfm4a4fYD4T6RtDGuyiZ3?=
 =?us-ascii?Q?qpE0ZZZhO4XqaOwpAhlwda9qSUPvv3hHiX2UMBYWzb1Tf0/dnIOX63Ubd5Y3?=
 =?us-ascii?Q?IS5Hg6ORWTTDOiYuC7QNPRiYT1hskoqPRsEqoVTN89Pc+rj1WgmtYsPuCbXh?=
 =?us-ascii?Q?ylsCYNWuXeBJbGiBv+h6wXgaKCOGz810c8QaFSYCDY7M+IJ0Q1XxvLvU7+RJ?=
 =?us-ascii?Q?1iosNOFhSKHm93mG+pfMRKyFZ/hv6y8sAFYOe82Dyg7m3Fb+z7JQpgXiPHOR?=
 =?us-ascii?Q?YrIpowRoRWImQMW2ASgrGsMetmDpQyfuEZ4b9qoEDnW7lHqYz6P6jkO9NVIM?=
 =?us-ascii?Q?IyRWGejtKnId4vOrcITp8vNcWUofUO/elJqA9CjoJ92+X5nHRq4ucBkroMBv?=
 =?us-ascii?Q?SkhD1tIwQSpzOZkd4Ng06I0iLv9qkkoQyFrOow43aafkBIyRpbE4djkJvnky?=
 =?us-ascii?Q?Wg3RSYpaWWRNCE+fMvo3Ns47dEdH/6kIzN3ft4V+tu8RrB6J3llfrtt9ziT4?=
 =?us-ascii?Q?9l4l5S440Ydgdc6Zpa7pzPX3WKY7CSwfv5fmcyky?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+qIY37cp5tEpalaIHa1mF/VqIl6+kNPF7DpByA67Kdin85IAnYTgs9hk2tU38u4UsJ263+k42TuoLjczOwnpjbznfi9PV/DSEmq2S46Lkwxn+ZpzznMpOZoJdKBGN9mnZPbMJfeJQohdbSKaq+sRD8ZVeMso6MZwjtwTDzS618qrG2aP8Uo7pyhRa1suPe8xRp/Sk+j4G7XlMXgqZMu1jcEgtKbbMBfBvmUYWdc/La9d1aBwbPxVhigtJ28OlLotubf9FhebZUMSe+rbQJmpkkmyKJhTRqiO8Inl78/m3gortrReTbKyBOoX9re4C9DRzwiaudeWnCGhdH22UYzzuu1b9l+6L9XUS28dAv+m/LQpoiMjxd7eC8tl27T8itVSQ5uYi3Flmx0Eh+odM8nMjmz+EVrDN5kaVONKdyX/7jbsf2UjTE7R3kIWvyORaNxxUgr3YbGozYdiqckxCUmJRk1OhN68E2d4v3U2logk5FmZfr7hVeFP7jSYvYRqYBULgT7sSjuNUQyf53a5xc5rii5qZDME0c0iC6aLrLxla4ClHGs9oCCx9KLWv6evTQQInohnYBhUrEA1aQHqeOM/0qfllKVUecjbkw/ukV1DS2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7316d0-e13e-401c-9c2b-08dd7b91bce6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:20:02.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCLDTWPyUtA5qHwB2KOtQjY5e7YtTgNC24OUtadl0qhc64kqxzb1H2E/lGGsUELcJLlUL00eBTwp+nBxq3uuRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140148
X-Proofpoint-ORIG-GUID: kbwzT9UiGbNkpJayEJtto_2rJCzDMChT
X-Proofpoint-GUID: kbwzT9UiGbNkpJayEJtto_2rJCzDMChT

From: Eugene Loh <eugene.loh@oracle.com>

A number of tests check "tick-n /pid==0/" probes.  The problem
with this is that a tick-n probe runs on a specific CPU.  If that
CPU is fully subscribed, then pid 0 (swapper) will not run.  Thus,
the test will take a long time, only to time out.

Change these tests to use profile-n instead of tick-n probes,
improving chances that the test probe will fire on a less subscribed
CPU.

Therefore, also change the .r.p post-processing file so that it uses
only one output line (in case two CPUs manage to write output).

Finally, add skip files in case pid 0 does not fire on any CPU.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.kthread.d      | 4 ++--
 test/unittest/ustack/tst.kthread.x      | 5 +++++
 test/unittest/ustack/tst.uaddr-pid0.d   | 4 ++--
 test/unittest/ustack/tst.uaddr-pid0.r.p | 4 ++--
 test/unittest/ustack/tst.uaddr-pid0.x   | 5 +++++
 test/unittest/ustack/tst.ufunc-pid0.d   | 4 ++--
 test/unittest/ustack/tst.ufunc-pid0.r.p | 4 ++--
 test/unittest/ustack/tst.ufunc-pid0.x   | 5 +++++
 test/unittest/ustack/tst.usym-pid0.d    | 4 ++--
 test/unittest/ustack/tst.usym-pid0.r.p  | 4 ++--
 test/unittest/ustack/tst.usym-pid0.x    | 5 +++++
 11 files changed, 34 insertions(+), 14 deletions(-)
 create mode 100755 test/unittest/ustack/tst.kthread.x
 create mode 100755 test/unittest/ustack/tst.uaddr-pid0.x
 create mode 100755 test/unittest/ustack/tst.ufunc-pid0.x
 create mode 100755 test/unittest/ustack/tst.usym-pid0.x

diff --git a/test/unittest/ustack/tst.kthread.d b/test/unittest/ustack/tst.kthread.d
index c6252b742..83ae6f7c6 100644
--- a/test/unittest/ustack/tst.kthread.d
+++ b/test/unittest/ustack/tst.kthread.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -16,4 +16,4 @@
 
 #pragma D option quiet
 
-tick-100msec / pid == 0 / { ustack(); exit(0); }
+profile-100msec / pid == 0 / { ustack(); exit(0); }
diff --git a/test/unittest/ustack/tst.kthread.x b/test/unittest/ustack/tst.kthread.x
new file mode 100755
index 000000000..b5fe7177a
--- /dev/null
+++ b/test/unittest/ustack/tst.kthread.x
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
+             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
+exit $?
diff --git a/test/unittest/ustack/tst.uaddr-pid0.d b/test/unittest/ustack/tst.uaddr-pid0.d
index 263a7ca94..ab54eea40 100644
--- a/test/unittest/ustack/tst.uaddr-pid0.d
+++ b/test/unittest/ustack/tst.uaddr-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,7 +9,7 @@
 
 #pragma D option quiet
 
-tick-1
+profile-1
 /pid == $target/
 {
     uaddr(ucaller);
diff --git a/test/unittest/ustack/tst.uaddr-pid0.r.p b/test/unittest/ustack/tst.uaddr-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.uaddr-pid0.r.p
+++ b/test/unittest/ustack/tst.uaddr-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.uaddr-pid0.x b/test/unittest/ustack/tst.uaddr-pid0.x
new file mode 100755
index 000000000..b5fe7177a
--- /dev/null
+++ b/test/unittest/ustack/tst.uaddr-pid0.x
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
+             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
+exit $?
diff --git a/test/unittest/ustack/tst.ufunc-pid0.d b/test/unittest/ustack/tst.ufunc-pid0.d
index f076782aa..cd34275f1 100644
--- a/test/unittest/ustack/tst.ufunc-pid0.d
+++ b/test/unittest/ustack/tst.ufunc-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,7 +9,7 @@
 
 #pragma D option quiet
 
-tick-1
+profile-1
 /pid == $target/
 {
     ufunc(ucaller);
diff --git a/test/unittest/ustack/tst.ufunc-pid0.r.p b/test/unittest/ustack/tst.ufunc-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.ufunc-pid0.r.p
+++ b/test/unittest/ustack/tst.ufunc-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.ufunc-pid0.x b/test/unittest/ustack/tst.ufunc-pid0.x
new file mode 100755
index 000000000..b5fe7177a
--- /dev/null
+++ b/test/unittest/ustack/tst.ufunc-pid0.x
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
+             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
+exit $?
diff --git a/test/unittest/ustack/tst.usym-pid0.d b/test/unittest/ustack/tst.usym-pid0.d
index d2f5ec5de..9aceab355 100644
--- a/test/unittest/ustack/tst.usym-pid0.d
+++ b/test/unittest/ustack/tst.usym-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,7 +9,7 @@
 
 #pragma D option quiet
 
-tick-1
+profile-1
 /pid == $target/
 {
     usym(ucaller);
diff --git a/test/unittest/ustack/tst.usym-pid0.r.p b/test/unittest/ustack/tst.usym-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.usym-pid0.r.p
+++ b/test/unittest/ustack/tst.usym-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.usym-pid0.x b/test/unittest/ustack/tst.usym-pid0.x
new file mode 100755
index 000000000..b5fe7177a
--- /dev/null
+++ b/test/unittest/ustack/tst.usym-pid0.x
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
+             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
+exit $?
-- 
2.43.5

