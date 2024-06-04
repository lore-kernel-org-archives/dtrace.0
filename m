Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08912149DE2
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524694; cv=fail; b=ZO12VBrV0vuT3vb7AGWNC4kv1Wnx9iRCSsbtLP28I7Pdun6/oQCI+SuST9es8gBRux2KJ5bT30HvEufEruLkhwJHSILKvpTXDbPIZxb85zfWy5k6gxtHc7SMuFMf5ShA32a4KCr4CDPYQe1YmziwnwOO7AzOSx5CvoCx+H3Xf2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524694; c=relaxed/simple;
	bh=h8KWMuDh+6YTnupNNi8PvqswXiExgeginlUlxrKEZ5g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RKAAvfFdhiCxXKzDtEuNqmofw721v+RNsLr83+AKMfGEfrsw/GPkJR+048tyJ1V/j+78n7fWGJBLNVcRNKAI6bEj7MWd6aY28mBhhEwo9teD629nmt4siXgiscnIx9lohe9oWm0SuKtEwDHtTLxvquxPBh1gVQ850QI3uyfAwu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnWI1032101
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:32 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3Dwk2IgEWYR0VNJZE?=
 =?UTF-8?Q?RJrHZ906TE1+PfgkjaILzA93l0ME=3D;_b=3DPIVIe1Idn3Y/RktZFlG4se3is4?=
 =?UTF-8?Q?qGzbzego2zjAVCz8KPGf5CfflUrGjW0WFL98FqATLp_uPccAqqs9oDPaUFy9p3o?=
 =?UTF-8?Q?hP4VDV+qvbRsH1Y0OupUdPFRwA2PlCyMkyFuEffYucch6cFQ_l39+yo/j8RnAKK?=
 =?UTF-8?Q?XFzIZNu0RX7yRhe4rnoiwyewKm+imSb6Guoe0/N9czK6nqjjBHe8mT_80E8xkFg?=
 =?UTF-8?Q?GlXdnPyfcQj/fE01gVZLyejtlJxTqUKBXPgQst0MOF0+TuH6FFySYcw8O+bW_Sc?=
 =?UTF-8?Q?a7BiW2jJuAyevKmI2zXdPfSdPPUAaCsgSj/fgIKoYpE5HZx2WvGeM1YHhgzp76Z?=
 =?UTF-8?Q?P6t_VQ=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5mca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:32 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454H26kb016356
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsag36e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgkP3ZDujL94pq/MlRlsxeBiFwGN0kFbGQppJoWUMBtihp8ryES6UMSAcUCnz97E2sDSsxUTAHOsAspP2IMWVZp+VGUzQLLqZkjMHqWNdrD/y2g8uYHUuiycIH6NcyHqDJuQfYkWS8zgxT6w7rnmNXVlBpk3LwmIJUv4vWujVhEebgov+e8qasHO3oJ377f1GbxZUw7rSes1KPgMJ7kkaceRS/PaeE5GUIGQXSduNynvoCLoaRNvm2ucRzYGxoM9IPsol7KyVfKTCF9SXjHQBMLzHehCBMA+vjcrort+XEmvlY/3K0MsJeR3Xd4zvgAwglwb446qR6Spj1p8c3gwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk2IgEWYR0VNJZERJrHZ906TE1+PfgkjaILzA93l0ME=;
 b=UpNtOlU28tZg6JHJJbUwfdh6QLrMrk4ug467EkNiX9CrZlp6TwL+ZaFLzM4KMJlQdx20pCPNqvKrMd5uTzGeN8JlfnbdfZpagzG/JcUT1CO3+2AQfIMKD1YCqA3wWWXdPwRtHfWC/plEPGxa/Rs0y5JWiP7gdrJ3n0mWFPvOn1t3NyocIr1/4kNCu87nyIowtNxIkNKRL9KBuoHGHuDc+ugDjVX/8fVecCSNSR4PkpWLie5otYN0OjDbeY0TSh748m9wUgAWCMoGNYB0V/Qj+VjAoOrdVgWXE4dr//EIVLSKeurHQ1m4o4isJGc3BiD5KjX7cfrGlEqDMeHTd92lAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wk2IgEWYR0VNJZERJrHZ906TE1+PfgkjaILzA93l0ME=;
 b=ovyzY6IKKMfWhd6yamJKN3tzlQhJDE87UzaWXZaHVHUXhsh2pF+vHiMCZkUbzoYBYOzt9RKY50+Y86STydpkaL9eiyZe//ZqjDp4pebPTMTIeGE1Mln+Km5nECTwtfDzELs4vcyaL57Dju0zHHa4YphchlpJfDwufETok1H8jK0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6799.namprd10.prod.outlook.com (2603:10b6:8:13f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/14] Move comment closer to the code it describes
Date: Tue,  4 Jun 2024 14:11:00 -0400
Message-Id: <20240604181113.11505-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:208:335::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a7f428-1f69-4474-8a9f-08dc84c1c05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oueYhnkLm+FYMm0hRogqkSnNcsP9JDg/tdIduojXOZtDDq6swqZ/f4jLpjyx?=
 =?us-ascii?Q?AmXX8SilbmsHlUUwlFrLP4cSnpR5kFgYCS3CkynYDv7Ndd8Q8wBwZp0foKZB?=
 =?us-ascii?Q?9GwvyjvhHan4wfdl5lW/uA1nqWfnW6KGZxNhK9Tn2ryBMiv9dutg2GJsBAR4?=
 =?us-ascii?Q?0C5gldEOtSK1cf0XoJdjf1dI4IRl690Wg/6Ib+JcXX6TGPBw4BPaCP5yQAj/?=
 =?us-ascii?Q?Gy4bw9WOgjVHR5WIWkX1fSXOxgedyiK5Na+R6PtQnknX+35l00XONrz6c0D1?=
 =?us-ascii?Q?Sglj8KLjb4X36PD3f8r/6LD8xud7QKZDmKi4w/9UwkWGlGr5R2T3JYI6amtw?=
 =?us-ascii?Q?s2WmQIwLbgTuJYgRb6btMqgfJHVHKGmkNVuH3huKIL4RvhCwxl3LtD6lAFvF?=
 =?us-ascii?Q?qbE6ePSsr0fIQDkJLk41NgShjfiK0TGmlEHqxggBPHlPsWoBqZC/ePFh0onl?=
 =?us-ascii?Q?YOUD159oA3PMuX3Xtqq66dWhS062l6tVzNtErMg2C09HZ/Q1GyKC2lSqJ5V2?=
 =?us-ascii?Q?7CUh4WYsbDSiu+WuTKg9kx7cm8vg2jjjz7/MG+2RwR9klnifFZcfkPC/oaeL?=
 =?us-ascii?Q?0Xk5sLB97iQ3h0VaYuMq+1NYe5uhevEV69Ev4YoLZiKA3NBTDy1VF9Je6gTF?=
 =?us-ascii?Q?wlo7kRoeBDIgQQum/Cch2Xqh4OKChe7MsDfTjv0QvLi2MgIUKs5ZAOS/pSgv?=
 =?us-ascii?Q?sIIBK1xj3VIxs1bnDlV8AQzlnOfR9QBwP+Somy49P7wDCx7c3wEJ73Rmmeaf?=
 =?us-ascii?Q?KalaF4ID6F5UIkbFn56vXR25xdGL5PN1VEQrASCudafJd7tidkq2LVNEt6kh?=
 =?us-ascii?Q?LqiTHMmkfyghvy96cGxbNZEg+NZeGx564RZcUel+XH1vkFt/8Mq/af8t911V?=
 =?us-ascii?Q?Ba49p20Yg6VxHme0Evt7XqmbrmS6N19XOuU4HfOMmAL6r6sVZGh9iYW2PH1t?=
 =?us-ascii?Q?okQrAvp9If8Sr/y60GkOTQXIdGLr6AfolaUvH6HtrijAfOGgUOr7ymj1Sqji?=
 =?us-ascii?Q?TNg8MBh5P/3Hnr5LvkA1weodfuWHmG6/yHICxOsvoSWK6y5n669Dot3/pSMJ?=
 =?us-ascii?Q?qPrXcHS38GsTPxseVHOFzMexZiC8w2x0vsxWYVfk7VLJvv7azziKYROVYjm0?=
 =?us-ascii?Q?o/U42fLJBz6pLTkkmbFE+m7I9FamTJWMAPKG6qxelMceVVGsCoAVBxZkySlN?=
 =?us-ascii?Q?D1zqgT5cTgfxO9noTD3BuseJgUp7pu6PfYYA78h8b6JUUATDmovCb0xTqswT?=
 =?us-ascii?Q?dS7kyTnmq62dU6PqSSf43iuxdoa0iFkBrNK9+vsSsw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vfglg0MK1bK0zzuS8vNOU/zC2exIyDBdX7XFr9067RBitEjJiMiOeylrLOnd?=
 =?us-ascii?Q?GB8rbHvnd0M+uZjDVtJE4MTxZXb8tWpt4pkYDxFirc6nzjW+Oj70aauaivE/?=
 =?us-ascii?Q?9zFrlqnWxU9DbB9mmPBnGP000J+y4yAAI/WcBOPnSQAk6tZ0+3QXHpb8fJ2R?=
 =?us-ascii?Q?NmjDg+vL6+5mmUPvyrUnBmP5KOSxHERMT1u5kDfkcqGSokCGxXsNDrMz6e/Z?=
 =?us-ascii?Q?CwwdGAdmUIpf0dFRYGSIuNhkDA01ncTxudjvwzxPSVKO83ctZyV/cuKKqjJ6?=
 =?us-ascii?Q?y6/yGg+vrTlvYidceee7wWj5ujwjqirEvCuKUK7OIahoWjJcuO6SyFgquwQ1?=
 =?us-ascii?Q?+d1qEGeCj20+edlPk1AYxaTTE+Af8NljW/mJpUP4CXFhu8MnpyIun5VPV0OO?=
 =?us-ascii?Q?DZZmyfb9xdBQRi0AB8ac9e497YnJxWEQJyjm2aGaTN/Ob4eSuJM6JeW/DEyQ?=
 =?us-ascii?Q?q+SCXxH08+MDjav7CNmV++IITVbClSGr+KMdOGkurwKiOw1OVWBij8+qrBTD?=
 =?us-ascii?Q?oaFiqajUOi8gplVct8MjLMLOLfBhkDuMgnmyzlny+FQhwxzcKKSksCHwaBtA?=
 =?us-ascii?Q?bkEXE8PNhQkqxBrsszLAfEYJB2g9H+gMDKvzxREp8q4Pyg5Oi7ecuNqrVwoH?=
 =?us-ascii?Q?vnDpENxQV8HY0RBTf+J0xKEnDd2iK1FE5Vqy3uUTRDBiyRmqTHxnEcAH0j+K?=
 =?us-ascii?Q?sZHuQIOUEbsVuw8cZKKnxep8XPc3A7TiyLN/UnkOlDG+kFYx2A9RcUxyTpVC?=
 =?us-ascii?Q?ibuhHCNb6QyDXbGZ/hlOFuwUkswqqu9z9n6Xirnemxak5mGCvi5IHhoS7sGO?=
 =?us-ascii?Q?OX3RqgrQeAzrJ1AFcUFNfmDAhfU4f+Ywzbx8TLcnHGloVfoZEKarRZcRlsJ0?=
 =?us-ascii?Q?4R7egq9HOUVqEb1BfxyMzP2uF9KyMoMHMxhPKIn8aNyoX5VkPgcg5LgrUHEt?=
 =?us-ascii?Q?wRgPraJT0FrPt/xEue5Nbgfka5IpX+iTBrtdv+aEYSPbOrJhQNPI7jUnsdtm?=
 =?us-ascii?Q?7hDDrV3ejvqLf6kIli34beI9nnLGB/ziR5Gb3gNN6vtOUc2vXNPbgUV7XyDA?=
 =?us-ascii?Q?BHvfl2StUmOIYGWlMoM8QT6KWDW64hFZO8BcTu11IaWbzt3+ufH2TAOU3Tli?=
 =?us-ascii?Q?PlpiTDO1BLFv27a8IOsqklZmHom7L431lz0SBlSOk89tgKCGFEo8CFelVf1W?=
 =?us-ascii?Q?qQXUnDaqxsUUhyyPS/tKV8Ha2Jg1Fn4OOvrtAjkChhrEunSJIRfF8L/JMfwC?=
 =?us-ascii?Q?fUUL4InMsPO613ECb+RWiyJslU0W5EY8n/h/6Dhb41hc53lUGWDyBxegyQ3z?=
 =?us-ascii?Q?zl9Nt1TKVbZSTm+og1jewcvjBl+KL6Y0T9UodFES1FsQNt5Gsvo1x6QG+jIy?=
 =?us-ascii?Q?IB9VabNMulSP5qEaGwT/LxPU95d7w/2qV7GuvG1G5joSlFVCKKQ4iQAf2lSn?=
 =?us-ascii?Q?PGez4XJAx/GEg6/XkhdkGtD6uxIjuZFns1yoSJsiD5l9Xykem+UoxOma+7Kc?=
 =?us-ascii?Q?drAVF6idTNVsZUms3eEc+b+KhPCjCF/5ePwi8suKMyvMo7O5cbDu13+8EC51?=
 =?us-ascii?Q?Hza1pBEvaJVyKLU065yb908Kq2yQ3jZg4yRg8/BW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	U32h49o8Gi4aWwBsnLZKLBZNxp4T0veWPzVhaZkRm69lzn84gIxO0l1Vvv1gCJ26OA01Mfv6+GsXb1DcUNC5ZLIWi7qEKSykAZ4WRrurABdQFIN/oMpCxaNZpSg5OgbsMBjMjkaEhXpjunK3xOBtQVjaAbAq/+UGC1jQFlU5mEfCoDKJy4JFz7oc0ajMomPq4RwE3930I395GuhvfoqhXj2EYGChAtvBm/q4QMHeklBOv9Al1Ehq6c2fvNOT9S/ExHfaUajZ3QZ9N0dJ3DU3CR1LCozAvVnChMNFPPEdFdxHJY7n3AEPukOVWMkWYfW+COKCo6uX/9TXIpX0uV44BUsDadHS9EImA0+g8kaq/LifVQzRPK8PAWC8CWcasnYbW5Enew2LDn0hpO5uqwnoXXDJ9yB8ynj+mqbpV3XMYEfw/SV4l4VnISyc/NbAisE0VTyhiJdlM4OUHCUGmXH44x6kg/G/I1Iww90kSlqE79JYH8DX7kmKWh7LXLt7MGpe+ps75pmMg3xUR/FiS9BRhLORzCvDXJ03hBwXKTB/hl1WipxZnhvigH1OydbIy0GBa9j03bN2pyYlLE3dsEUNXo7XvLwvq/jdhartEHXJ37Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a7f428-1f69-4474-8a9f-08dc84c1c05f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:27.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJRWBV/orPANg02SbxXtxN4odmALvFnWj6cqTjAcxGXTrjkeBE4LZokULEd5Cy1wfb13R8chWytqJHPQbBmvXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: YKUNv_frnnXVr4syLJc9zoU3wtJOiyaP
X-Proofpoint-GUID: YKUNv_frnnXVr4syLJc9zoU3wtJOiyaP

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index b712c589..afc1f628 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -337,15 +337,16 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 
 	/*
 	 * We need to enable the underlying probes (if not enabled yet).
-	 *
-	 * If necessary, we need to enable is-enabled probes too (if they
-	 * exist).
 	 */
 	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
 		dt_probe_t *uprp = pup->probe;
 		dt_probe_enable(dtp, uprp);
 	}
 
+	/*
+	 * If necessary, we need to enable is-enabled probes too (if they
+	 * exist).
+	 */
 	if (is_usdt) {
 		dtrace_probedesc_t pd;
 		dt_probe_t *iep;
-- 
2.18.4

