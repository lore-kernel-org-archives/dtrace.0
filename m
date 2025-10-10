Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF392F656B
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108078; cv=fail; b=cLT/DQsHozGKoxf8mMr5Uf7yxbuw/oytnjbJ75ta772vhMJMzB0E5et6c4P6fIB9anBPF2CIgUbenD0zVIqzh3RhmEszRWOG+QY9uKgEedW1jOU8Ru8B6CVdKI3MfkKfIAVBkqmsOmPTZt/Plgqw4IMTVfZen0z+oNj9mwpUHzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108078; c=relaxed/simple;
	bh=lbOQIiqHzxA314HO+d437gBYeythg5oMv2c3LUzE6UA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aREVCf+rMxw0lePR2Bi4VISYB10DoHtVAaZyWntrh8q03H4CycGtN550zU2X1kB8CQJ6XaK0Bv9B7IYOUZxPXe8EVlRYziwDJdQ0nM/hPYbUUgm/QufawetMhS5pmSkagZz0cOBNXWVsWl8Z011+yI2FBBagmfMySCUyt8ZKOho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kOq+9qg5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ibVGL8ab; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kOq+9qg5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ibVGL8ab"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A8tbnK004262
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 14:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=TRjjyH+cmnLwX7Sgm4lmw2oPxpFOsp/P/TKnYrTdlew=; b=
	kOq+9qg5+dXRqVIsdW7WJXG40keM6ROumKXKHfdF5wKWHonrtfaPhANrnQ5wpd6S
	RT6xYADoM17MtaoivVsD0xvXazbHvGZwpbTwOSjqMdoMaoaQqLKjLJivkvKp7ol9
	RX5V4u99Be4FlcP55V5KYaMBEEr/apy6XtZTtRgCKPykY+3TJc3ooaKGro/h2Cc7
	Ja8BVwzFt0SDwH6RYtopUj057/Ohq6B2Rm5HneqDHMEYP35hadBohqyrZk+HYKRZ
	EvFx2T2zhdYGROgA3LPYfJYL5PXBbNXCr+wozGEE6S2za/xMmGN+xhNocn8Ib/dL
	jMOe7pILNkYwVKgl/LDccA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6duunn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 14:54:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59ADr8Ol014423
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 14:54:33 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv68tnje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 14:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOMMTi6A9bxq/axE8cJWzcMrqBilDQwLtd6bEC8Qkfq064v8aWba02hWXuIuStNzqNZHXazo7Q0HPJbGsr6RUMc+pFuWSVu7nftlL87cuCqV3j6IAs78ystrMamyBB03gtD7ixbpZrr+uE3utvZOg33BGNpglH/y42q0063iFuurY8WuS9GdgsIM7cgKp1PC0wKfc3lokwrVMpmboPfh8gKgY4ctXxCOCTlAfIwRgAh6AMHSzjm+tzozyp9upJ8kDK2VkIHu9j9GXVWRCODvU7pyiK5HsrNbgNEqjjK4fAngG9EEuAvmCZsymnVBLbPAD2xzbamMDZ+qlMmtFMfHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRjjyH+cmnLwX7Sgm4lmw2oPxpFOsp/P/TKnYrTdlew=;
 b=q6qljY4iIex/JOVGbfpBwbqPTxUZGlF5uEMBNCuQG4xRldfAkMzB6k9qUdAzN3gHRVa8kDSvatkN9iplycBhxdJZUZXaWME2YSkpSr/qFpo0h/B6L2jScRV6iHEgwd03StHpTzFoZ24TM4pXKzBeKW5UOT1XmTKegHKe4jEGiQmyAKvTu+xronpoKOC/yeCe863IIXsVLa5N+T55ShKbibG2jqzkK9mnW1B7oDG2N4WHnzZZKZ6gc8/SZAwau+5ALUJ3eCUccqGhjvXeNBK3TuHptf/PqjApy2NMHUWQUrKA3qH8puFQY854FMMjyEdU61wdrd1lXisPL6IN/z5+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRjjyH+cmnLwX7Sgm4lmw2oPxpFOsp/P/TKnYrTdlew=;
 b=ibVGL8abNirGLS6nt7pkFvv2ZXnroXd3YUF+pvPZtqy+8L2F9lajv3PEdfKG9xKVyAXfwXEx53YFtr6DQcyV6gN+e/3Ef5WtT4a5tOowO3XL+D1jP7kOR92aVnALp8Rl9Zx4F+fHVtx6ln2E7N0H+0kcdjrhJ2y94LZ72r82a8c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ1PR10MB6002.namprd10.prod.outlook.com (2603:10b6:a03:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:54:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:54:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] WIP: Update NEWS and dtrace.spec for release 2.0.4
Date: Fri, 10 Oct 2025 10:54:26 -0400
Message-Id: <20251010145426.13390-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0101.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ1PR10MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: f452037f-adee-499f-c031-08de080cea4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?myD0pRqxy/tMUpo/N/V7qTTZHAomViXkJ/9die6Bl+wsinkLfrBdZagh3vq6?=
 =?us-ascii?Q?1wbBRMKVZKDcZnZdIMBGmCx/rttjVqhBNU1cAiUtQcC7HUHcIN+WjpvujXNX?=
 =?us-ascii?Q?yTcF3MvDCB+JVvP/wxe7x1BRGMv4r1FY144X0RJ10NnpQImmQV6nNB+dwBcG?=
 =?us-ascii?Q?Fz9l2p+8g6n+c6d0QclFREgTxpdFP/bJPj/0lVZm2/G5IDkU3pzNQJ0JRzCM?=
 =?us-ascii?Q?wqdzF2IeSgi2Ju7bhrHYHcXf2LJNNbbbFARjAP2VzNcN/P7TdavHwm4Ml3Kh?=
 =?us-ascii?Q?44pwwawfnwjG5N/i0BMPgyVbdJdTKKFfHoIxFyXpybjV0V0jwYA/PDJYm+72?=
 =?us-ascii?Q?o6BtRBcSQegcHSiMBdcGS439nLOfsu5FQtBx3BNUR4lgqMS/8BJ1V10sh1D7?=
 =?us-ascii?Q?WHTsaklykRpeLEn1eeYa97ilSduNq2lIvLHySfDx8+X+BnbbIlRe2XGL4uXj?=
 =?us-ascii?Q?ki6IEjUvPYSCAjhXaNbooenxVnjc9dIk1ec8KSLbY2Aq9cDbNuzh7BjNSQR0?=
 =?us-ascii?Q?xjRIRyRutUHJnD5LtOsTsjlBJqPg8kPOH7/OM+CqQn3bmTxJaYwEqHCyQa6P?=
 =?us-ascii?Q?Eh58Dqebaxl7iD3bq07KoukHcK+zQRIp0kwvWPE0uiHc5VewcAMxlq2HJFbQ?=
 =?us-ascii?Q?dvGS0Kx9hOh38grDCwdPQoYV640+1GiuBqsaoEWWn2bNqLVt8915ow0FTFTZ?=
 =?us-ascii?Q?IOdnSsZCdfLxD/Kz2zS7QgsR9l2L2zyoaQrYcqrZXpV7PZZ1tQBoJHeTlKCi?=
 =?us-ascii?Q?VDZQIZgZEOfxGvE2mrpDN3rlSa+qNe7lRxY7Bka0s8ndnVtjAf9GEvQ6BeoL?=
 =?us-ascii?Q?lO6iAqPQyfjFa6JM9auEtOnFzssTfsapWg1IrXcbanSJE45i07wFbp423uzT?=
 =?us-ascii?Q?0ICtZ/Otl/ifZgm1/PEHdukG3oqybzsS0cFEjoJin8tlGH+mn2x7mkO4557E?=
 =?us-ascii?Q?gRLQ/pNmJmMM1HjP5J2lU4BU151Lg6gQRx73Fl3UZU0oMvF2E4YFNPQa3I1l?=
 =?us-ascii?Q?y+j51/qRDiIQE85a8PJYKmQY/3nlyoYXqiY1cTPHlivjjBHR4ca83fzr5tkj?=
 =?us-ascii?Q?6hRX2DfOzZZAqPbEZkiu1W4MQo5zsZij7LF5LXOCo1lOv0AvFEjHuSz60kSt?=
 =?us-ascii?Q?u2u1hCTIssCuDDZu4w324IUd8f+008qVR7Xdy5YcR9dQh8uwalZbqXnyZAII?=
 =?us-ascii?Q?qzeo/Sye4my83W/ko3h7bP3DnLAU98ciCOCfm6E1Oj2hgvZ4Yzh2yximWzw/?=
 =?us-ascii?Q?RSBkRCgvpykJj5l2GWvUrUOw2ymF0lB1QaFHpD+611/oohMgPvRnlapeEgln?=
 =?us-ascii?Q?LOoJu3jDRoKFy3l469xGYppEEQEGNojCVISQH5qZwclcjjdC3z4QEkMKjPMP?=
 =?us-ascii?Q?iqsTl8S9qHvcrjA05ixSvSfSM96kPfgvEDKerIecAU1SDNHFLgefaCBjmDTK?=
 =?us-ascii?Q?onVZXTLZ1kcBQK0r4skpFzUNAZdhF0+2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4DSoVW3ELnzo2RKm5xL8ytuu9+E2LLNTtxvuiBXvxbBqldtN6tX8VBW/rZ0X?=
 =?us-ascii?Q?y/YPrS31eDNU+qp32p01U5JPtavSmuuLGUEQkLTZriUBvqts/yeLkCSIwgel?=
 =?us-ascii?Q?doIULUVwX89hhs3IJGa2gsFfWVOPt1IgRAi15qr3m8pSoIiS0c2zEvRlk9UR?=
 =?us-ascii?Q?tYiN5X+0VnA78pismxlJgQaWNFjT9KshdSA/usE61f7oi21RdAu7dtMVx+EV?=
 =?us-ascii?Q?ZHjD4Kdp/mvHAHuTuhHE1Qs9GB7NDrhzHmYD3K8fYj5HGQ5VT66chZej+fET?=
 =?us-ascii?Q?H30zgAjl+YDazfqAj32f2CzGcJJxmIqSolXEY4d6Qy4jwAM3pt4M8j7W4E0q?=
 =?us-ascii?Q?KhyY5rbmjCPl0QaqSp4/ynV2r9BihOURPEOwCeQ08B+Gj9NHMzeuaeVmuhPR?=
 =?us-ascii?Q?/pHaJPdqIobShkKWtD+LqKcv6pgQ4uaNbu55sgTPXNFkV6t6O5Hdf/hWsVkB?=
 =?us-ascii?Q?2phMy5BM7IzBRO8rDAZP7pjuY/vFRjQXiub6yjbShC4jRBEjBiSGTRicrsGd?=
 =?us-ascii?Q?gi5GfvLDCWs2ONOQuiqmZubhReaHPJ0wK4Tgqw2zydloEajWc5eDmcZVpyJb?=
 =?us-ascii?Q?jaD9aKT34ufMKGwBKFabHpjnsuzU1RQyEXxGW0vyA6pPtCoDNnogmaxgO6pK?=
 =?us-ascii?Q?XRQaml+plZZUu1IN2IaiClodf+CkiVqCkvrVVTkU+mLxIQy4g/eTm5cNW4Ol?=
 =?us-ascii?Q?PS8Kqin6Oc6hKpU/JqXB+Vh93NfEkqmIDGs334dU6x9QT70rDjh277HW0mxK?=
 =?us-ascii?Q?HgqZ9Bj1N1H37/94/nX60MjlPEbYmhYnbXooXGpmKEB8P0HUHBWbKn9zWEWL?=
 =?us-ascii?Q?GzkveRyvUeZSqlwWZxypsYkS/7FyMON5QPNKzccnMF48KqRk9PQvlBuWfwLh?=
 =?us-ascii?Q?cO85Icc6OWxOxtfiw5vm/n19JwNSCgb//oxIJ2CFpAC0RaUZit/f11eCTNSm?=
 =?us-ascii?Q?ZyQN1ABBvUtkngCY2d4WfAapfRDbdAuX4Wnu7FHX+fwYxp/F228zzu3FtIpu?=
 =?us-ascii?Q?Amo8ueqA7rJNHbXt0niausA2QP/jGnU2HMKn0U5+pKvbpZJjmf1AxRgG0w5V?=
 =?us-ascii?Q?kqRdNJ+CXIVgK2X9P/5pyXrRzXvKKNWzkc/TiOWUIpuUYcJgI5XuAzt10VeC?=
 =?us-ascii?Q?I5U8qSI6ackTcHySmj2gcjuyctMu8nutQgl0kSItS+5aw83kC65uzN029lxn?=
 =?us-ascii?Q?ivQIlxQHE2TAb7TeD8Pc2VEzEmr+S7eFrLNLG08qB28CFivd/3xvRZixhF4r?=
 =?us-ascii?Q?87vZ/uahpg2FGmu62iBwlMOY83qZKFOxvDlOIvOBP4iS54YXbOMl60ChA8TU?=
 =?us-ascii?Q?m0+Wxc8vKeEDO+4XsHgVYRdjduBtptqzl6PybwMJXWHXDWP0DusKKqA7NSdb?=
 =?us-ascii?Q?m2x3XRCM67k1UHnWQCCwhTei1tLYjn9UQxdMxAcaHgVv4PqaCtWZ0HeVqNsc?=
 =?us-ascii?Q?FYfjdGBr7vV70prTcSHd5qhphmO/iF7mzY3Qtw7/vsHc5ozzAHrCiU0S2QjM?=
 =?us-ascii?Q?bXBVrfjtUIRT3FHVMo1NAKA8C8NvHsRu2YAWRZC25Zmlxgz3frkFu/m57KSq?=
 =?us-ascii?Q?tgJQtNvLHeUoz7IBtQsfgx2XFhFANyu4PtZCvYGv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gge6Le2HPbNJPkabX5FYwI0nwerXAkpTqJhLkylZTiqqrjNoE4FIlUEQLyZmCTys6HJ+lEWJuYfIwHVeq6LIKGQnZWU4U/9yHDiCOaKW2akLAsMlxCP6e0oOmrd7WV/iopVYd5ypwZ+qO350nYBn99q01Ortb/mPdvfSQCCq95qrQGsodEkuFgOHclHgIrqXmbQ2yytussFaO7+b/DiEC3vd4GhVyPLBlAGcGPblnUET8ipmYG8p4Pak3qmfAqykTal2Fe5VF0lyA76cZXPQjxGhm5cIkoCr6d0p7ZUv4OugaC+KvrWWNi7lq+Zbq/s0l6E9+W2hh1mzTUXHYd69/aRUzyPA39ZybnMWbenQDrZLRIFOJpkAnT5y5zWMtNDg49/4/747sHQv3LYV7ujsvbEBIUtQNSlbQlMh0X3bEmpoi3krXZa1j/jq5bOn0Ut/o/JLboQuRzqbc1GRnS6/QCJ3acsiaN3Oux+3gvUA8lKqNPZAXNFIRh5l/JQRvfFEmXDUrgs3uGfKDZA8sX9DOQacxfLTSZK4bjutixUA4f1TP6EeQ5INh1ZPyftt8M3kTj1QLwEj6RvBgQsHlFHN/dd+4LJ9Wm+cLLI3gRnvGLI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f452037f-adee-499f-c031-08de080cea4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:54:29.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umIn1KxMOXUOWJSJE6D9oI8euAxzMzHuBCijsnySBx3w0iRgIi3s0JsZhmCg6BuKVS1PtGiDAMjiOXWR1Q7Bqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6002
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510100086
X-Proofpoint-ORIG-GUID: V0DonPlmmN_yEUQLEU-gAo-1aPzNtEAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX03baaA2QAApx
 5Bo44pO2WbH/GQs58GG3dm8/ek12IXeZbvDYlmeMGUzPrXlditf/9LPcnV4QwYvBpuaTZPhM+pF
 BwrQDSJlqj7W8k610RbSQsoyb/6Fa8HjVDOe7ppe9KHyCHfQn1ZRjHMv4j3EUn4/osG/oVTrnMG
 hhCkAgVySZ0SUKblerDOBN0w0klAkWbfMuMzSEQ0ekgI4vWDT6o5DqbP0YO5aE2PPNJxZOXlbTm
 a9ta4yR6wBa9K0CQf59ZyU2tflejLCDCJPRb7s06NBaD46U5/dBA7z/tnhlFwoiVDN4rH2h1wuD
 buIvO19igy8KMxDVAh/g6LND8q7+QkAHz2YgpYagKqles9vIF+VrfXYmjQ6QTSMoKKC/Gz3s8NH
 HLIy5N8UkAiPv901WbHFjQd5a9Jv2A==
X-Authority-Analysis: v=2.4 cv=etHSD4pX c=1 sm=1 tr=0 ts=68e91e2a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HrAuVk7q57-0hI7mpN8A:9
X-Proofpoint-GUID: V0DonPlmmN_yEUQLEU-gAo-1aPzNtEAJ

From: Eugene Loh <eugene.loh@oracle.com>

WIP status:  Summarize work...
    starting after patch
        6b7ccc9d6 Update NEWS and dtrace.spec for release 2.0.3
    going up to and including patch
        bf23642fa test: Modify fbtsafety tests that use vtimestamp unnecessarily

WIP to-do:
    incorporate any last-minute patches
    update the XX dates in both NEWS and dtrace.spec changelog

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS        | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtrace.spec |  16 ++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/NEWS b/NEWS
index aa61b6bfe..2e7a23adc 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,136 @@
+2.0.4-1 (Oct XXth, 2025)
+------------------------
+
+New features:
+
+ - The TCP and UDP providers have been implemented.
+
+ - An stapsdt provider has been implemented for user-space static probes
+   defined via stapsdt ELF notes.  The provider also supports probes created
+   dynamically via libstapsdt.
+
+ - The User's Guide is now part of the git repository in Markdown form and
+   part of an install.
+
+ - Example scripts are now part of the git repository and installed under
+   /usr/share/doc/dtrace/examples.
+
+ - One can now use [u]stack() as variable values of type "struct dt_stack"
+   or "dt_stack_t".
+
+ - There is now a context file, which explains DTrace, to use with LLMs.
+
+ - Comments using // are now supported.
+
+ - The return() action is now implemented, allowing error injection by forcing
+   a given return value for a kernel function.  The kernel must be configured
+   with CONFIG_BPF_KPROBE_OVERRIDE and CONFIG_FUNCTION_ERROR_INJECTION.
+
+Bugfixes:
+
+ - A commonplace problem with dynamics variables overwriting one another was
+   identified and fixed.
+
+ - fbt probes in the "dtrace -l" listing have been restored.
+
+ - Function names have been restored to pid return probes.
+
+ - The built-in variables caller and stackdepth have been corrected by
+   recognizing when additional BPF stack frames must be skipped.
+
+ - char arrays can now be used in aggregation keys.
+
+ - The use of -w is now required for destructive actions, even if a clause is
+   being ignored with -Z.
+
+ - Both 'cwd' and 'root' now work (and other inline vars are now tested).
+
+ - The proc:::exec args[0] argument has been corrected for the case that
+   execveat() is the underlying function.
+
+User-visible changes:
+
+ - DIFO is now freed once a probe is loaded, substantially reducing memory
+   consumption when a lot of probes are specified.
+
+ - Per-CPU agg-map IDs are now cached, substantially improving trunc()
+   performance on the consumer side on many-CPU systems.
+
+ - D compilation now allows enum declarations where the last enumerator value
+   is followed by a comma.
+
+ - alloca() pointers are now printed as actual pointer values into kernel space
+   rather than as relatively small offsets into the DTrace scratch memory area.
+
+ - Strings are now handled better with regards to empty strings, the meaning of
+   strsize, testing, and NUL padding.
+
+ - SDT probes that were not firing because they were dependent on fbt probes
+   that were not firing with the fentry/freturn implementation are now dependent
+   on rawfbt probes (kprobes).
+
+ - The USDT parser now handles encoded hyphens.
+
+ - Function Psystem_daemon() now has better logic for detecting system daemons.
+
+ - Management of CTF and BTF data has been improved.  E.g.,
+
+   - If the kernel is not compiled with CTF or BTF, there is an error message.
+
+   - There is now an -xbtfpath option, with -xbtfpath=none disabling the use
+     of BTF data.
+
+   - A BTF ID symbol lookup now checks that the module BTF data is loaded.
+
+ - If a pid probe description is supplied with a wildcard probe name (that is,
+   function offset), instructions are skipped if the kernel does not allow
+   probe attach.
+
+Internal changes:
+
+ - The mechanism to skip common fields when querying tracepoint probe arguments
+   is now more robust.
+
+ - tstrings are now managed better, including elimination of some leaks,
+   thereby allowing more complex expressions.
+
+ - DTrace version numbering is now consolidated.
+
+ - References in dlibs to major_names now explicitly mention vmlinux, so as to
+   avoid loading modules needlessly.
+
+ - Parsing and lexical analysis has been improved.
+
+ - The subtraction of two alloca() pointers no longer receives the ALLOCA taint.
+
+ - Aggregations are now snapshot "just in time" for theoretically better
+   performance and for more consistent reporting.
+
+ - USDT discovery has been optimized a little.  USDT memory leaks in hash
+   tables have been cleaned up.
+
+ - Some unused variables have been eliminated.
+
+Testsuite changes:
+
+ - Various tests have been made more stringent, reliable, or suitable for newer
+   kernels.
+
+ - Test dependence on tick-* probes has once again been reduced yet further.
+
+ - New tests have been added for more coverage.
+
+ - .r.p files have been moved from /bin/sh to /bin/bash for better behavior on
+   more distributions.
+
+ - Script get_remote.sh is now installed for better testing of RPMs.
+
+Build-time:
+
+ - BPF library functions are now compiled with -ffreestanding.
+
+ - The developer package now includes previous omissions.
+
 2.0.3-1 (Jun 10th, 2025)
 ------------------------
 
diff --git a/dtrace.spec b/dtrace.spec
index a325993a6..55a9e4a85 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -72,7 +72,7 @@ Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
-Version:      2.0.3
+Version:      2.0.4
 Release:      1%{?dist}
 Source:       dtrace-%{version}.tar.bz2
 BuildRoot:    %{_tmppath}/%{name}-%{version}-build
@@ -230,6 +230,20 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
+* XXX Oct XX 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1
+- TCP, UDP, and stapsdt providers implemented.  (Alan Maguire)
+- New learning materials:  the User's Guide in Markdown format,
+  example scripts, and a context file for LLMs.
+  (Eugene Loh, Bruce McCulloch, Ruud van der Pas, Elena Zannoni).
+- Allow [u]stack() to be used as a variable value.  (Kris Van Hees)
+- Comments using // are now supported.  (Kris Van Hees)
+- Scalability improvements.  (Kris Van Hees)
+- Error injection via return() action.  (Kris Van Hees)
+- Improved string handling.  (Kris Van Hees)
+- Various bug fixes.  (Eugene Loh, Kris Van Hees)
+- Various testsuite fixes and improvements.
+  (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
+
 * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
 - This is only released on OL10.
 - Redesigned USDT support to work for LTO compilations.  [Orabug: 38011704]
-- 
2.47.3

