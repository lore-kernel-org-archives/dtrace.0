Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D875218306
	for <dtrace@lists.linux.dev>; Thu,  7 Nov 2024 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731018447; cv=fail; b=eq0OimmrlAyhkbAjZu9+KGwObNFQE/j1xlrUPEHpabGn9s3SrJN5Lzlyy6oMd/ldmqz6+1NCOjJvbxakYrjmkeD0IoPdpFvCpzS8y8/meQpVduNoQzcZmF2DziWpMBSMtMZji9STsvXFJfk+AGqDzQqdBPdnDEWN0SFLZFWEt68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731018447; c=relaxed/simple;
	bh=/pOzdHLmNloH/GEw0Z0H2IIULFV6mIOxevaSOMUc/A4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tFzy8JFSA5pZPpy8byHqNnUGra13K65dcdlpsTyY8pkPEahP0py4e3B7j2QJA0y4XjxrXziEfORvOtDOYIWWNYUUORwh9p/Rpx9AyjByjvOugUXMAuTsnLJCKesyTOK6S3gEr40xsVXtnGsLmitk6qAAgLykoYugaLxqD26FcTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VwTc1u2v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hFpW+PYr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VwTc1u2v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hFpW+PYr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7LflQW014151
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 22:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=4PFDVF1eXzFQTmSZDHCjffGsW83iZ+54DpSH8rzHKMI=; b=
	VwTc1u2vkL2h+jzgBUNn8ZZaz8OSwOI/Z5TlEuSm2zLwRg4XBQMxD/zd/YWSqh2o
	1NkD4ufeRg3PVMMaRcip/iA+OQ7GGiuSGHjRTtg29TqRHqLOseGvjh7OIbm/vDRS
	Nb3gym7h7TacsL3BgO7Jj3Ngz2lC1OXYPcUMwaPFRMySMGMX6pk2dLuAuk1D5EZ9
	b5S4aw6x7+D+1dYUmz+a6TI5x9mdJv0PLAf55vQhhyIuohUClZUzoVmCzqoPm0ce
	0PzcXeNEZf2reBBCYYJ5pNGUCmpJzt5mm59/WfDACRnv5e3P3EMdcMcwGxoPjKsm
	H3J25S3G5jkTVqLL/DYSbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nb0cks8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 22:27:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7L3UMQ004991
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 22:27:23 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87e31py-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 22:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSnCDtnfPbjeJattV833YFaJVZsQYtPnWgE6twvrBTKaJ3kFXHOuzBquesQw7RnRBnDe/S997cBPey4aKDdAT/ZAtnm0tNCUTZiOA2SHfoZ8WYPqE7QrcbvqogkzzYRi6d6nMP+QolG0WrB7ROy6N7mLN6ALI5fDwCXfSWnMOCbOwqAL5S2cQSxzW6CWvw6SVtNovVd+ZhogbFfAojh2tuLfQM04d3V/sm1xWVC/gUkNlyN9QZ6hAV4S2OpIYki8K1fosMGNVZYj028VMOPqPMIqUcs6s30UPDF2G5zwvipzG8o5WUpSW71Es06gueqcCSKRhkzSTpawhgIwy7VRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PFDVF1eXzFQTmSZDHCjffGsW83iZ+54DpSH8rzHKMI=;
 b=Gk2f1cs5OQITadUhTnk/iR3piovuBHAdMA+dQagUlht4laK9rCYDnxrxj1/aBaByZVdH63x5b1ZkPPWGdv9EjM6MbwozL0EjQ9934LvMx60P7wdk9tizJiWwe7gtyjqFjBfgSzdcQ4IM7ghYz9LeOwqoavLwBp9zdhqJgaPfzIeWL1zqqZrZhIuNKpUypnPQu/CYGFbE0HD5mn63TSp41GI1miNEM2u4ZAmbfuMNr3ldlKINPYBHcS7oihsBsmbIm7b3c84TZ3aCXEP5fBTvE3OqXtb+5n8FScERXYUaCJkXPY6p82NsShtyTDX+SCKlFOP6kubuwsuI/TC9OHuF9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PFDVF1eXzFQTmSZDHCjffGsW83iZ+54DpSH8rzHKMI=;
 b=hFpW+PYrnhVyf6eT545Wo6pvsOCze6tmaOifYZOkSgbgD/+WhzX9udWGjnTDdDiCQUNsNve5Z+wmR38WHeHvuh0GoblRxX1gLHE58ahwToLI7Kr/CCnjOhlNhl0nxspxjAsbSpwidtgcP9S1fKNaXBiUfN4sZ+JCEVdCBc4xRyg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6393.namprd10.prod.outlook.com (2603:10b6:303:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 22:27:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 22:27:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Optimize USDT discovery a little
Date: Thu,  7 Nov 2024 17:27:17 -0500
Message-Id: <20241107222717.27548-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf0e254-a523-4e44-56da-08dcff7b57bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nHuG4ycqUNRDeqdo4J/Z0NYqRLKbGwoCLd4EKn3y+wOGmUMvCVu7ScCkzHWe?=
 =?us-ascii?Q?48ERmH2bgzjTjPZVf5YVTcxZYPhmS91wVlxmm9UtJMS/S5Bfec2hKaZMUmQt?=
 =?us-ascii?Q?kfkYAuR/RHYqfPVMBLUvGZWVWpXBv3C32eAUMS/f2aZWYW3IutNm1jQ7FUFL?=
 =?us-ascii?Q?rUFTO+nfebz6e00LRaN42SBIL+qxiSFRIbgcf4BmMN62pasBdZrHmXwivHxP?=
 =?us-ascii?Q?HLZgQ8NoWDONmv4cQ+R6xz1nKDbIj7ulgm+ORiFtU8s/h3dU46oiPEKdQsA8?=
 =?us-ascii?Q?HVDSfJ240DrGBBmqh2g1mbdmEn71tpxRftWFlSevbzmD05fIVLc79xitNUDR?=
 =?us-ascii?Q?rvjolL4kQduqUeszV7bipybrQ6MSU/LNufnAwZaq9rEZZfICtGUgvoisWiU6?=
 =?us-ascii?Q?mepGOASTymcSDodo0YF0HMxgJuYEZHKSGEiyNnlmEr0G+yaXO1qWsOpnhr4q?=
 =?us-ascii?Q?OcRlz43pvxASunZRrCC0AtT4Xibu9Q+gx2IzmE1yQeny8wBST9KbULd7cbas?=
 =?us-ascii?Q?5FhCw2l/VqubI51qQWcE/DF7/1xFSDUKm4WQ2nbxf3I1ySC5Hxw2BJIQJICy?=
 =?us-ascii?Q?3Cm5d43ZdR7uv8Iiah6hodi5F+g7ax8WHhJ6H4iUsTZoZre3wFPAr/xNH/Kc?=
 =?us-ascii?Q?LXO53g4PUX2s0jg72KA3sErfPDXtqNw6jScMyNQl4heqKb1YS/68tRLh6B/q?=
 =?us-ascii?Q?6HPFVflfKFbewfU4lix0e4NZRIqyab8Xw5eVQ4La6hcajwM5lHRi8faj9gZe?=
 =?us-ascii?Q?7mBm8OjM45zUbDmJGxXVbf6zsOtU/tUIYMKxbJT7ocHmwFZWIkrDKbd5HChA?=
 =?us-ascii?Q?9Sg2yW+Q9w85NpbI0qE3732qPacc0lj0kqU87sEYP3adPuTRhR3ZWuI83iuc?=
 =?us-ascii?Q?2xiZq5JRkKQsB23/i0IHDymKzs00kIHWxjWnHEgS55hza6+qOdim1O5Knoo3?=
 =?us-ascii?Q?L/TgeLOT7D2d4DmkzMFqjdaXHBnVNEwqQlYwv0KqXG+vNIUlDaUO6PFMRpix?=
 =?us-ascii?Q?S+ROhyS+GLJpvX436uJJy3MSD55i5/RBN4ZYGjpfZX7ehkrm2vgkxSY62CbB?=
 =?us-ascii?Q?FROQAPk21uUDqxsvud2MfSmCDBOe+XDyoujLwN7fVBdw5wctjEJNx2Ei5tVX?=
 =?us-ascii?Q?uLLGs4Ernq+pifpj36oWJGvcq/5k/fMAJJ1l7Lx56K6U9mvnqUI5psTqzrmk?=
 =?us-ascii?Q?hkZmP7sgY6pWhe06r1fcU46vcpY0BBErga51TnlyJJJ42ftymSU2f4q7OEEu?=
 =?us-ascii?Q?S3DfuLUKY70A7xGXwqE3MozKaj+EplstMQybqsAtwy036wnV9ez2bi7o0rFf?=
 =?us-ascii?Q?uAYnhZZ8BqZtLpIB5hVX6G7A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x52BykDH6CV4G4LdzZEYJTuC217+3jPT8QZbs87XWS3sJrNkCxzXAAcOJBqm?=
 =?us-ascii?Q?VLbHNlSeHrEnRqUyw6JRPgfZiYL/l/Bb17vjruFAy70OnZpC85I6a7mMk6OO?=
 =?us-ascii?Q?mIKa70iIKET04gHBcxNLQRNKcrJs6YKUDNF6TGZokFWFKQYN1WZCs5gh4dZ9?=
 =?us-ascii?Q?Rii0PuwS231FZQn063r1Ao4hVV49jOK+uwJ5WAONe+VJtk35OpLKCE3IS9pD?=
 =?us-ascii?Q?hq5WK9kbhiMMLccT7mNU1LkC0f2YKDlfA3s+hPgyeUYqhbz6vxOLFdBgxvgw?=
 =?us-ascii?Q?ARR0TMcEe3AdZPa8ybUH+DV8tXS0zxRz+4E8bG1Sx9O9Mg5fcVxqlypbl9AD?=
 =?us-ascii?Q?KtqPvbSKX4oSegAyGcf6jVI0pgPg/wPAdEkVejsg8BAJ2c2x4mqY9kS/M9sl?=
 =?us-ascii?Q?qNIjChKfP94jkyWr/7wLZNezGVQ1JeC9YF99luCprUM8FxpGdcK9A+mdbdmf?=
 =?us-ascii?Q?oDLIXXFQXivnzQXyp0jBKV9crmX2bUrYpped7uhIs9FHY8p0AeweRPaqnrpD?=
 =?us-ascii?Q?+2x+gOMDGNg5Rj+nLQyCNBYqFvF3rT9KfglkbfBfW+XxcAj751xsxy1Ft4uN?=
 =?us-ascii?Q?/V18M1t+NyHUOwLyvd33GH2mORrLQrAbEa/0W63t+3AuOw9YDxNY7IhMo691?=
 =?us-ascii?Q?J0YgLr4/ERk8HQZXYgEuPbAMq2aoOTTE96J0oZ6w0pLyED7xgu/bA5yhryex?=
 =?us-ascii?Q?5XeOiqaZ1X38SrKnGUaEvyUqsHVxFQgid+/a/xIIbdTtcoYs2T2lh6MXLEMV?=
 =?us-ascii?Q?vgvYXge/UlZaYxp/osK+xSsaEqLN3/cN4v1RXq8XQrsfUrwFb05TTe5lV0Lr?=
 =?us-ascii?Q?jaWXGgL/vHkjl3vKQKlcqcJYRaUM8IUF0CzyiKGliQm2zXWnPc29F2D6bv+q?=
 =?us-ascii?Q?sQu17jJELEbdX4yQG7BoD1P1GqjKA0WDvI3INeCzJ4thmuD4tlcxlAOk2Mkz?=
 =?us-ascii?Q?nhIQZpfPp3+5d35cXlw4taJkQ1F0v9tpcVtWcqecjrSNiVNSrO1cJaxK7z2A?=
 =?us-ascii?Q?lwZijHZcFS7Eh2EwDUkqEOU/AlEoxPEJq2a479e4BTR9pDOJRmQtWbQd/GtO?=
 =?us-ascii?Q?Ze+uScyR7L6oRQ1PlGK0yqcICEpxYB4I9zxOr0D4YzAVgmQfLWWxEBOMUIZ2?=
 =?us-ascii?Q?v6KzsPxZgYO72Pk075u8QkDqP3u/0pa0z+VqT7rbXMKw6MovYSiv5exOLhWH?=
 =?us-ascii?Q?Ct8toT0VEVKOqAl7WjrkDDGdz7ktNzMierEixuig4h1HIeTLJGi/1jVUkJTB?=
 =?us-ascii?Q?wquvgF5t3URFqZrK0wRXF3Z8yIO/FzKEwbORoEpX5UYEbQxvflfJqlxtnA2M?=
 =?us-ascii?Q?2Eg9Yi3YSrdr90wcySowQR8jNre8QF73HgCl1Vz1BunGFCJNTP1/lOfplOjm?=
 =?us-ascii?Q?v7N/metkXxK+bo4w4uIcGdxrxgAjC34N8aUh4oUdYO5BXtcdl4jja5TFsZ8M?=
 =?us-ascii?Q?34jgDij2SdmRAjw4TdPwIyEiCkT9LRHXhRzcwGvXJa+6Vf4rhrxz9nbNAk5P?=
 =?us-ascii?Q?YDHMAcdqqUxxPdp6ixm79Gx3S3WzZ7I/bOAqaqTETreE/TUSe4qk6QJ7L8a5?=
 =?us-ascii?Q?zZRJg1WVU2Gfpvqv+4Sktc+MQ5DXAJFHPo+nAi7x?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0m5f9RogbQMHm+My1707Njl/taZVH1t7LUhDF3WEzxkIs1DmQRp3W45SGmWoNyeBhlw+BnapiWjn3U71oHYmQZma6QJ3FSienMccKfmrUtS1y8TLqkgY+HCcYR8Z6BddpsMgywMT1sn9DsTOE4BqIWtYL+rpc0k3uK8IT0Y45z26+uH41A2NfodzXV8pasNfiuvE1dhXR/WRmv6wATEcatmmnRenDzppAQ+FIvq5ub3FDjbO6uOgQOo3QUZFmCvtF60B41EkTqfqzdXnFwbtq9wpG/3vJnKCI71sF5UKKM2FveDy80nFLMXu83gKc+TVIjOj0j016mQbmRvz1irRvtbSioQ/l4LwuBoTJOQphGPt5Ql0aZICOEcGMeCb3dNg82EoxJtDc2A076Zcx9uGFL4L9txL6OoMa+SdI/qOy9lvWe2uZ/ZzFXZya9YTsTbpAj+9tacWViI+KlOi39xC5Qmh7XJOsGcbZlMFhFJB3sD3iuc6iuQT4WAY3IzOdpsQxiaDU4NidU39jYj2BnW5l4qrR9VVbVeOq3p6Qjphr8TFBbvxzFV7FEY+w5/j9uuC3bejKRUkHV0gtowzy6Br5QWdYuT5hjrcHfNvmGi88XA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf0e254-a523-4e44-56da-08dcff7b57bb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:27:19.9037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnzx9nfBGOpnTHf6vMCoZDiwCo1hhIOPM34ZGIPHftp1tFKU2gWt+m/1+/nADXb5C4YWUN5/PDKSoBBWic3tTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6393
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_10,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411070175
X-Proofpoint-ORIG-GUID: TwcCWtH3ji8uNC7e0jXp9Jad2WaqkmkA
X-Proofpoint-GUID: TwcCWtH3ji8uNC7e0jXp9Jad2WaqkmkA

From: Eugene Loh <eugene.loh@oracle.com>

We want to reduce the performance cost of USDT discovery if possible.

Specifically, a number of statements -- with probe descriptions such as
"dtrace:::BEGIN" that could never specify USDT probes -- will not get
their clause flags set with DT_CLSFLAG_USDT_EXCLUDE.  So these statements
get considered unnecessarily during periodic probe discovery.

Therefore:

*)  Expand ignore_clause(dtp, n, uprp) to support the case uprp==NULL.
    This case is independent of any knowledge of a specific underlying
    probe.

*)  During probe discovery, check ignore_clause(dtp, i, NULL).  This
    sets the DT_CLSFLAG_USDT_[INCLUDE|EXCLUDE] flag and allows faster
    exclusion of statements that do not need to be reconsidered.

To take advantage of this optimization, users should specify providers.
E.g., instead of "BEGIN" (which could conceivably be a USDT probe),
specify "dtrace:::BEGIN".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 261dc717e..0d2dfd456 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -267,7 +267,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 
 /*
  * Judge whether clause "n" could ever be called as a USDT probe
- * for this underlying probe.
+ * for this underlying probe.  We can pass uprp==NULL to see if
+ * the clause can be excluded for every probe.
  */
 static int
 ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
@@ -275,13 +276,16 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
 	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
 
+	if (stp == NULL)
+		return 1;
+
 	/*
 	 * Some clauses could never be called for a USDT probe,
 	 * regardless of the underlying probe uprp.  Cache this
 	 * status in the clause flags for dt_stmts[n].
 	 */
 	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
-		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+		char lastchar = (pdp->prv[0] != '\0' ? pdp->prv[strlen(pdp->prv) - 1] : '*');
 
 		/*
 		 * If the last char in the provider description is
@@ -314,6 +318,8 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	}
 	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
 		return 1;
+	if (uprp == NULL)
+		return 0;
 
 	/*
 	 * If we cannot ignore this statement, try to use uprp.
@@ -504,13 +510,9 @@ static int discover(dtrace_hdl_t *dtp)
 	 */
 	memset(&pcb, 0, sizeof(dt_pcb_t));
 	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
-		dtrace_stmtdesc_t *stp;
-
-		stp = dtp->dt_stmts[i];
-		if (stp == NULL)
+		if (ignore_clause(dtp, i, NULL))
 			continue;
-		if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) != 1)
-			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);
 	}
 
 	return 0;
-- 
2.43.5

