Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D813AD11
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135144; cv=fail; b=ntyHbB8sBJSfDi4PcECQEiyWUBL8XbKD2Yo+wB2AP0UY3guyR2zuO/AQRTsGVgkVf+G+eI0k6xGvlNCicB5AcxVZbWLIYC2APmEAkENzhGmNKKRoc8z+o5IYmr04L9Ob953DusIb6jr3MfgNdgaDkA2KitrRWuWiyZAFGytpx+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135144; c=relaxed/simple;
	bh=BNgA8eWQ6JGMi3jpJcqF6VOTiTfzsmXb7HPyuliIs/s=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qzGRPrhUpCjw/mWJlB2poDwP6WUw6JGkLLzEUfZY2AtEThyFtm5jD/dQP8z+VzY0vj7Wfgv2HHuRYvYkRjKSaedFftAssNDJ0ZCxtfs6g9E6lt6GiwpGCK4el6574ncjS7cstqWqmwxxXl6HWjGDn/evIrUeF3qfAsslMxRDe8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i/b6+JyV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ezsxp44C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i/b6+JyV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ezsxp44C"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtfJx014165
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=DGUjEE3I4gr026W+v29Z7pIhSMoQcizNwYB7Bvhl3iw=; b=
	i/b6+JyV8HzSnwrR3mxK4M9Yz76HWvdN4u8ZeNwpupJkpS9u9kv7UvcXOCsMlst6
	0k/+bihMNTyWpfPuUfC7T2siEHB8adw6uKgNTYMTVl9B+VB2pYxvWuLmP5hgE2MZ
	bNzP6Jpa80MsAxQsLqZ4PiTBTKlE4VaKxw8wAKR99H1b/Cd7rJi3WeQotABKnGJV
	0dEzIsdaOUtQQ8/FCbdCyV2FMhAGtDSRX5IHbPNLZ3ExF0KsitureYB+CjvNxIDG
	gsU4Zn95qT1Y7F02griRoVwKqFPwAG1HbphS4kuJwqRAxMd2yWwyOFGxzXGVtVFP
	Ql79HniXM7NoLIffBkwgVw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwbdcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:05:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SGTQ9d034771
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:05:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd67c2x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5bHEmvp8F4J96kJ33qIjSVnNKtvL8FpJMJY6Vwbn53NsbzqsIqeOFJd5RCnDvfzNuOaZkG9c31Rn7sWuYr3ge/NDa8XXNnDYRqU7Xft1VQXEBSNvWgXl/6li2J10VSQUDKcb+xTYdXJC8+U+YoJ3753KsBlxyewJvCoQdQ8MW/o096fo0594Cscq8y02Yzrpbc6vz8MXQmHO+c1IZoS3XkIFlC2uq9X0pmkRqtbS7l26EruGzwNyu5danFKkYgJ41NkNs1oro1xsRw2YZeN6b83N7xGotH4/M2CjE2Yo6EX2Q1lSxYaWX9a2Z3XFYIDQlzR1U71w6vi23p9Wwbmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGUjEE3I4gr026W+v29Z7pIhSMoQcizNwYB7Bvhl3iw=;
 b=nfv50Tzf+Rm/DFiX2ZZ7so+xyZBg6jv9pvKZqoLP0pA3kPw/c+Tbge6+UqeA0VaMsdWpdeOnaQXTutuapBS0UMOtHA+mss1rm2LlSwABQpPGE5Lthi7otlL5Yu1Zj1PhRAf8+Jlyo8xJx01l7wNZ4jOEZfpMfbuNIlOKitstqq9f7l3r+kjgPB2r1SNIfssexmb4cC1DoEf3JoR97x8qdYZy8sxNKKDVu+5/S52TzoS82IAUh+AlJnL0djr6DyYFMFFL9SNqf1YKAcl5hkaYLGgdyW+LIdMorAcXEDrsoDJPLYhV/MXCzRsyZXmhlhcaT6tgi2Vaz7QfUiv1Q1wCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGUjEE3I4gr026W+v29Z7pIhSMoQcizNwYB7Bvhl3iw=;
 b=ezsxp44CHdzJ0nim4Qi/OIbcSBaybaNrlP68YdZUXrc03x4Q2cepKfnV2WhXVYQ4KAongbc4FZlAOZXY6h4mY4etE5PYzDYo91l+IO07ECYRrlT4kKPN15o0YXtBOEk0KD3c9v3bHO7zQbuQFd6wAKmKiduwxdTdLYnAuHhMsYM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB7402.namprd10.prod.outlook.com (2603:10b6:8:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 17:05:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 17:05:36 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 02/19] Add a dt_provider_discover() function
Date: Mon, 28 Oct 2024 13:05:33 -0400
Message-Id: <20241028170533.21335-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:408:ec::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e47227-794c-4913-fbd5-08dcf772bde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dw2cxZqUKHds8TLYd09iCLMNytrqgXD70j9HnIg0Zwhzrh/JgSPGHis3bF05?=
 =?us-ascii?Q?2iin33mOt9vMb7dWxxiY+zzEjapoj1U62sAvJRDh5QIHvqEyt/t8sfeHxULv?=
 =?us-ascii?Q?pcyRpTQ1ounrBEo8jyfWIH6xNNU6M2RaBy8rU6rr3aRB8hMlYIH8l+Gpr/pw?=
 =?us-ascii?Q?Pm+0dV8TCrciWxgWnrkw7F/ABd0HTXgxLJ4KzRvvn54xBz/NNyjr6UPpcBzP?=
 =?us-ascii?Q?W8PTRT6LzIEb4dHH9UlYBu4LBG7oPtKQzO2AAzwfEtcxi4f/2oiwYL5M7uLr?=
 =?us-ascii?Q?D5yrtWmfC8UX5/BwLlSdtyFeoE9Uasim+gz1vkLp4Zwp9Wv1d3KunioRcXLR?=
 =?us-ascii?Q?ENTRCJZfJG4Gy2v92CXBtKqW3DKMG8arF3rZtMIN4v25/kr9ur64db/0Fls0?=
 =?us-ascii?Q?4BfLboiORG0MNT9VBPMLQ+eq5Aw5Rob8BJdDylReOZwneU1NU5KZ3sE5/jzl?=
 =?us-ascii?Q?jEh3h9YPwlHEwgtQDQA6KBsM2aq09WDuBE7baLT63z+fHNeIig2xpUz1jzW3?=
 =?us-ascii?Q?jwyYNIiWG9ZL2sDJ8uzg5UoGCBKaJo/I1u4XhiGxIv6Q5+RLmb5ey0g2pR3l?=
 =?us-ascii?Q?h1bhcPVFI/U6nVJkHkC74YT6ULSRNdjMjGA2+vUwWF1NoYlIZiZJ9qieSdz+?=
 =?us-ascii?Q?TyYIH06pzqefxbR8eDNmly4e1a4dRSpggGH1lqvAmusfqthv/SrKmeZfdn2x?=
 =?us-ascii?Q?FWEWva98QR8Tcv3LvsvAFUosqtypWeFhV3cgwgKSI9zXAJVnybo4wdjB0iym?=
 =?us-ascii?Q?J4Gfq6hUM/p3kklz2A4st6NZt3etmrbNh62fgw9emCLG7X4lesiLAOpVbcWR?=
 =?us-ascii?Q?AaKpIyvXbaAqUsjIu7t+Jub2qdpAeer696EvPk5itYqxylh0XQn657eHUNlQ?=
 =?us-ascii?Q?xHPGBEIrlzlbBj4q5n4UcLUXE3NQIiNXQTMHN69Pcxw/FTAqMFKgMqT5sfI9?=
 =?us-ascii?Q?J90RTaINDYPahn2x6cV1NMQSE28iddHQVhWD95NccU4NsaPrw36q97iCN5Cb?=
 =?us-ascii?Q?38CWQb9Ipxt3tZHNFQoRgdk0z5LTZp3arRD0jkqM32aCgMurU1VteTYbD/7T?=
 =?us-ascii?Q?ICdSdwrons3463xGQBDpZt0QiE8MsdRNpNMzCqQgyP9oCInfo2mWCPM++z3w?=
 =?us-ascii?Q?MzG2+vPeAdnOSx09kBlquAznDxRiK5VkRBNvScXCGg9fAxNPoIckcvvIGSnW?=
 =?us-ascii?Q?a0Zh5D4KQzdTlWr9E/xTn6jTx8rVUy/F1fmZpv3tt7FXF3bYtlGrspJc+OGr?=
 =?us-ascii?Q?E/vIMixqr3HD8YloZlAR1d2F4JLB5TfJ2yNSdiiT/t99PKUwf8XB1Q1xYzmC?=
 =?us-ascii?Q?A3QJVqC8fBzmROEVNfSQ/0y/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sTrSd4UsmwiseIEoyBD504RtLTRgggvd35+dLTwJVGqBA0oYna3atWCw+vDz?=
 =?us-ascii?Q?H9YfKa4XQB1UXkp+3l0EV7BQ1vV8Pjc1cU9IlgAZAkREY37HXmY3GJIAW5mo?=
 =?us-ascii?Q?rIwStEE8HzQ794fHZzjVUtzSMlxNa0ZMo8PzauG18/nhaRFWFarFwT0F2gjb?=
 =?us-ascii?Q?59yhWOSQ85IrV84CKIj+F0f2Iud02Mh9dYS1seJEB/Z5Y+h8N3TQ5MgczlBC?=
 =?us-ascii?Q?nDEv1IM8SXVKZEXzy/4JssV95jjiGSfPkVI9b2YEkr6598u4kP7Erz64Ugm2?=
 =?us-ascii?Q?xjLZjF1hXhhxBXFyWWsCmtmeZ8vrGGywZ+zKoZ2I+291cX+gr31vGHRjDo/o?=
 =?us-ascii?Q?jvQSvzuKvCPmngYTdFPWNy+XGFRe2GxcCmGAuYWQP98hmQvQqEdPlRZhIgPt?=
 =?us-ascii?Q?C9WhfSBSvGFA1PkVTMuz99zw7ZlpHGymDKyx95BCFYtPNzChDga9diZJ0n5N?=
 =?us-ascii?Q?JFwbm0QK3kIUyK6kK3WDG1Qk/Wcc0zpS2wlFjoRlYTqpF3sEkJ+yJ7velEx7?=
 =?us-ascii?Q?feyQGhzTQhY+WZcjpbA/cNFpwICqr73XEBFwdqeuv8EZG1EzANHPwr6/Vanz?=
 =?us-ascii?Q?+W4okQc3QfhlVBDZbrdXxtI+Zw+Zn4YaKKtY9imf5+6kpKhqZF0k45nndwYh?=
 =?us-ascii?Q?62s5y8RA0yw+uAW3N6UfB1GuETtTe3IzPmVRdMExx4i/omKAz/HnmW/qpukD?=
 =?us-ascii?Q?qzaG2HFKP4RnQMQGIPu5sDSV91jWc42pFiCg0VEgqG6aKo+UVThCNOuc40bS?=
 =?us-ascii?Q?+kUfePRzhuV7AvNwHaCepapHFUWHzccSqpn1e97vMdQ46fHi02FkDqMCmnBw?=
 =?us-ascii?Q?iIyqEc1B0XkT8StwTC/PMYT6UTpO3YX3hraN+IwOojXfIQc6MJEZhdy5v4+t?=
 =?us-ascii?Q?nb8K4a2WD6B1JvgW294tq7QszMyLekv41NPNCbi4ElZbE4Z3eSXKGWCnpg2p?=
 =?us-ascii?Q?PBfisUDUZzTLd9n0G9dWwJRCNgdF4ye0gIRGPYnbSncuMq4sqGpH4pjfuRY3?=
 =?us-ascii?Q?Gl54f999q22aPjbRs8DYzkSIQjMFmbVu078dEM7Z2ec9rOxrRSzdkN+veN2h?=
 =?us-ascii?Q?r6h5OR3M1MX7N9P/NrtH+1U6x2yJIAgwAhOSKcUKt0q0XVnt9i3QUWpb82J7?=
 =?us-ascii?Q?XBaqMelHq/3dbrjevp7mMn0ydSGJd3l/EEGOF7AiVwLANJYWLCo3Axa/zhA0?=
 =?us-ascii?Q?m5bb6C9hDuJPmzz1kO4hyI4BzgxUmDyfsz3xb4n3OliBRLOpnMZHZL7uhHWy?=
 =?us-ascii?Q?u0gX3gvWeFCVtEssK5omPGXazk70qllVK3AAiWElnmU3Cp+n5OlaxRiKNsYE?=
 =?us-ascii?Q?hNZNjaBHyBvYb0I0z/fHox8p8hDeTMrGSrT6QmvYOf5XDc/Utu+QoxVJzIAb?=
 =?us-ascii?Q?dmVUqG3/mo93s7pgnMv34q+gyt7rfwBDg+kvlA9SSy+8xb+9jQ4A3cHkhugK?=
 =?us-ascii?Q?luoFZ+JqG7iWg5JCDIWYQS8qE/pgTlnvfBCYYgzK5H0hA7oCtIOnfhDWK60o?=
 =?us-ascii?Q?Jo3ApCknRKKnKrRxQ/YNf/OXUnIzB4vHyfVzrwk45BApQ4gqdEt21xfGxV3Q?=
 =?us-ascii?Q?i9HMDAUuqZb8C6gKDCNE7oKeNqUB3imhkPkHhtVl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4geNYvTZQs7cWyp8M1A7GSBq0jNmVIv4ZCviuxfaGBn1wBGm7XamL/pGcBOpZ6U+E7ULOQU+K65Cptc5dShW6PBUdw7yJYN7LQFFNdFrA8D0JO6YWPEqTx/MNCOrVIvq6RRACKoF9ME4W/+9SJxcoSJ71cpPtoROvWpv1EoUAOYMeRycz9P29pC5rCm8s1/sJ9+3CRf0nT6OoxMz7aqTdrOFXnRAlPDohYYsb/mjbVCPtB3BHJbtz/BmAa2X3Q6oYucwgNVVVxFkbZjzFAnL/J05bOTZ68RwrkuruFFapIRMhsRwkQkM7+mmRIZ4d5WqscpBVIdUf2pKTuqK98NZq50vgybc3cjC8N50Q4bTLx9AYgEWK/qrADDn9BfgRXAhi8B+QkTJSZFEPfqnHgvT5QCO0/RDo5mAAV2zbuv9++Fv0kChlOrybdhxqX9qwCl/siykMoZ7je5rNP/HSsu7zH5aw1WhS7aNv81eXHy8wIg9LBiff4NGfrxTmZ7/K/trdHWJKFFKnZmmxp8XZx2RxCkdUckPoHFUATf3soMOX/MDutaIifssyRY3uPe8TjwSkAos1A+DZ5Z3QoO+LYjbay+55P4gy3xBCbqt99n1cUI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e47227-794c-4913-fbd5-08dcf772bde6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:05:36.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4N1xsjUvi7F1LrnEkmKikYY2LGQtf0v/k4gQHtkpY6mtyrqcVWiJn0NXFy/My6SME24o+T2J7y30yXodtvZzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7402
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280135
X-Proofpoint-ORIG-GUID: awLA-39uPLng0amozs6YQ-07fOSxVelk
X-Proofpoint-GUID: awLA-39uPLng0amozs6YQ-07fOSxVelk

From: Eugene Loh <eugene.loh@oracle.com>

It is possible for new providers and probes to appear after dtrace_go().
Add a function that can be called for such discovery, on a per-provider
basis.  Each provider that supports such discovery needs to provide:

*)  a function discover() that performs discovery on behalf of the provider

*)  a function add_probe() that adds a particular (discovered) probe

To support looping over providers, move dt_providers[] from
dt_open.c to dt_provider.c and extern it in dt_provider.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c      |  4 ++++
 libdtrace/dt_open.c     | 22 +-----------------
 libdtrace/dt_provider.c | 51 +++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.h |  6 +++++
 libdtrace/dt_work.c     |  3 +++
 5 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..856110306 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1275,6 +1275,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		int		fd;
 		int		rc = -1;
 
+		/* Handle probes discovered after compilation. */
+		if (prp->prov->impl->add_probe)
+			prp->prov->impl->add_probe(dtp, prp);
+
 		dp = prp->difo;
 		if (dp == NULL)
 			continue;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 848141ddc..1f586fc4f 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
 	0
 };
 
-/*
- * List of provider modules that register providers and probes.  A single
- * provider module may create multiple providers.
- */
-static const dt_provimpl_t *dt_providers[] = {
-	&dt_dtrace,		/* list dt_dtrace first */
-	&dt_cpc,
-	&dt_fbt_fprobe,
-	&dt_io,
-	&dt_ip,
-	&dt_lockstat,
-	&dt_proc,
-	&dt_profile,
-	&dt_rawtp,
-	&dt_sched,
-	&dt_sdt,
-	&dt_syscall,
-	&dt_uprobe,
-};
-
 /*
  * Table of global identifiers.  This is used to populate the global identifier
  * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
@@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
 	 * known providers.
 	 */
 	dt_probe_init(dtp);
-	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
+	for (i = 0; dt_providers[i]; i++) {
 		int	n;
 
 		n = dt_providers[i]->populate(dtp);
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 8cfef0ba2..354dfa1ee 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -18,10 +18,32 @@
 #include <port.h>
 
 #include <dt_provider.h>
+#include <dt_probe.h>
 #include <dt_module.h>
 #include <dt_string.h>
 #include <dt_list.h>
 
+/*
+ * List of provider modules that register providers and probes.  A single
+ * provider module may create multiple providers.
+ */
+const dt_provimpl_t *dt_providers[] = {
+	&dt_dtrace,		/* list dt_dtrace first */
+	&dt_cpc,
+	&dt_fbt_fprobe,
+	&dt_io,
+	&dt_ip,
+	&dt_lockstat,
+	&dt_proc,
+	&dt_profile,
+	&dt_rawtp,
+	&dt_sched,
+	&dt_sdt,
+	&dt_syscall,
+	&dt_uprobe,
+	NULL
+};
+
 static uint32_t
 dt_provider_hval(const dt_provider_t *pvp)
 {
@@ -149,3 +171,32 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 	BT_SET(pvp->pv_xrefs, id);
 	return 0;
 }
+
+int
+dt_provider_discover(dtrace_hdl_t *dtp)
+{
+	int i, prid = dtp->dt_probe_id;
+
+	/* Discover new probes. */
+	for (i = 0; dt_providers[i]; i++) {
+		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
+			return -1;        /* errno is already set */
+	}
+
+	/* Add them. */
+	for ( ; prid < dtp->dt_probe_id; prid++) {
+		dt_probe_t	*prp = dtp->dt_probes[prid];
+		int		rc;
+
+		dt_probe_enable(dtp, prp);
+
+		if (prp->prov->impl->add_probe == NULL)
+			continue;
+
+		rc = prp->prov->impl->add_probe(dtp, prp);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844cb..384d4fd33 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -62,6 +62,9 @@ typedef struct dt_provimpl {
 	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
 			  const struct dt_probe *prp,
 			  int *argcp, dt_argdesc_t **argvp);
+	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
+	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
+			 struct dt_probe *prp);
 	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
 		       const struct dt_probe *prb);
 	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
@@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
 extern dt_provimpl_t dt_uprobe;
 
+extern const dt_provimpl_t *dt_providers[];
+
 typedef struct dt_provider {
 	dt_list_t pv_list;		/* list forward/back pointers */
 	struct dt_hentry he;		/* htab links */
@@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
 					 const dt_provimpl_t *,
 					 const dtrace_pattr_t *, void *);
 extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
+extern int dt_provider_discover(dtrace_hdl_t *dtp);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a..5318cdb7e 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+	if (dt_provider_discover(dtp) < 0)
+		return DTRACE_WORKSTATUS_ERROR;
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

