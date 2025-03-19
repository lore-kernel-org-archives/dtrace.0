Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF361B4138
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742404533; cv=fail; b=a4+MJm+JrpKm90O7s4g+jJoAiIJTgAtVP58DmW8DkP2JJGMz4H/rC7YLZdFSYybEtoEG18FuTnC6gV2I00a4qZwJEuDe10IvD8t6FU0X967PxHQ7OoipXDZrHborSR5GldFJvhpfNdKVZlwSVvHEVMOBu9dveBYtI68sNTReJ9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742404533; c=relaxed/simple;
	bh=6bxvaXj4S0HJI89nGws2KyLgD7eWTw1EngJIQENNb+o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nFJ/R+Z59hTEkJtnCYeH9P8NM0Adh95W8WwEgbH2RsqOoKlO25Dkr8ns9CHU3IKwbmfEGSOu3rE2mQ1IHo3g7r2cMB09VdyfQeAC4QpjBI12EnrKsL0G8qFz36UIV4bR94JZ1P1BxZ6T/JTSU2PWHflgqOmLpHgPmrTON4BAcm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F+nTP7w2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gpz4y5fG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F+nTP7w2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gpz4y5fG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0r82017364
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=AYHeF3NUNKoIEKRXhS4hppEU/qvsUVr7YzrdgxYI9KA=; b=
	F+nTP7w2r27Jz0mxP46BRq+lHSgT9It5rKRw2spXqWI9KOkyjO5376RWhEwD/LtF
	h6lb9ng1nchpXYPzKxyjxoLiLDLENgJ4ofIcSD8kBIsolw9pL6zRgR7OEbXs0ust
	GSAaxUlEMctP8QDu+KCB/bA4hgp25yiH8PUWJzoSUA4vduDtyRDcFwxZPN4nWzR1
	xp3UFDpx7ispuOy7MoQntJnAL8TWYwoQBAJoB/+zw0qEcRlZFDr40JHsSoU2/WZB
	zw6YGeMYGYmZKWwq0KSPvmVa4lLHd6U5ji/vZFZ1BC+v0P0KDNCItA1/Vzz6zaOG
	jlnn4Xl38z6su2SME9aOCw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m3uj60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:15:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JGqeOi024449
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:15:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbk7dpa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2wF3ay0vo//1FaJ+W/V4yYFU8tPgn1slZdstDCRcClWj7YLv6mWxkcBXb9Ins/uqrHghbjF+hp8+maiiCocYc57i8fxV80CY0PiCVa6+mZHP1K4L3Yc4z98Lo0uIaLxuxX1sF/DIionzhOkU7ws9kS7YQ3pRrErOaEmJ2y8z7PcNgvad65gJmG91+5X0xIRo8kFUeoA45ozbR1OI300Y8wGDArpPF6LHMeZb+nUoWun3N/hyCMYaajCyjoPFis+r/ppBKkmJS6tdM6PpYk09tgkSDESnE4lfXmNC6vekOMZFda3qpza74cSmNsYF9Z8N2DoCqnxXBaKI2Y/dRHHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYHeF3NUNKoIEKRXhS4hppEU/qvsUVr7YzrdgxYI9KA=;
 b=S8Iq3uzLjDmVHR5RzdoixbgVT58r8OXCh7nFQBC03jni2CDeLMFfjxfyw32N4IrngKrWW/QOoor6u0v6q96Z6ABVSjLyolHLhpNUCMlr9Zo0/huIkAxLzUOfdUZdxQwPLSehwk1Y2NsVl4ODceG1ZCzu7v+jJSuDtcwSfSLpekBEWv6n9l5oR5aGRk6gaODKNy+1OIlRhGV/V225I5OU6bnjz2nAbz7u/xDLDD8RCDKXPZZr0FYFx+GSJn+ASTIrQZBkJ7WUUCCkAAaj01AYRm6uuwXYcEAGphZ9tnfj+IsrqGx3z5+0yHCUI5rEYitQPS7ivX0u0q8brYxXq+TZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYHeF3NUNKoIEKRXhS4hppEU/qvsUVr7YzrdgxYI9KA=;
 b=gpz4y5fGDGWL9AMgVED8JdzjWs7z+wtgm1Hlc/sXuBuTIRDDUxhG++CcEv9JgpRhRGg47/4vlj1wRQFEnDG5sbwpGuIxNdNYL9O9pE+1hOQM6Y052ojMx26ih7wY9tgz2I88+Uz1Ip8mKipl6QVmRo4eOZCetYWoz2OIwir4PKM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7242.namprd10.prod.outlook.com (2603:10b6:930:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 17:15:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 17:15:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Make tests more resilient to different prid widths
Date: Wed, 19 Mar 2025 13:15:25 -0400
Message-Id: <20250319171525.1877-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fac8fc-aa27-4aad-60df-08dd6709a49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WuUc2eYjgXkScwmL2R+bH6oLYe9KPF6u8lblhnpJS0a30q/sTwCQS31/ZN1h?=
 =?us-ascii?Q?E/VOm90rrRqfT1K17RmWlAl4gzfb2ph9Ht4gusR/cGgqvMiKmXhW9OkaH5uF?=
 =?us-ascii?Q?4aga4TyRY8GYKDCNAzZsphflIeh0DbIw/caBQ5tit5ob/4bDmKgYu3d9YVDb?=
 =?us-ascii?Q?ZmkA81ZCKAkqfvmNkkr9/JThnqHWUonb10jp8026mKIcP3ETjRNL4yn6pwDn?=
 =?us-ascii?Q?Rz16vtyMhzadXnMkPJ7NbBY9mVvPMs0elkHRQX2fKaXK8u56BpzJ5F8lgMuu?=
 =?us-ascii?Q?EtfuB4nQeZirsUKLZthXuz252ow2/lrwaSK+OHeExhMXZGhIT+gryzCEcvVP?=
 =?us-ascii?Q?T4QW7NkhCoOBMhsdlghIWdwvz4aaGwsG1+ooqtHBexSRbqGS7BauzTiGIThW?=
 =?us-ascii?Q?qg1I2Vg+I9h/VPNw+PBvgLEGq0FTOtbZOoS7xT9qZHl4YA6Qm5sA4a1yLNxf?=
 =?us-ascii?Q?r4tkk/0MvRPtn5ZzG+8eLH/AOpQ5YZblaNOUOPLCfavMoyFICx8J58OPUGD8?=
 =?us-ascii?Q?IJXkP+6Z8iz2ZbUZx0YGOnQGzToxCkkPyi2JzulDny4nnnget8HuT3HRMNea?=
 =?us-ascii?Q?SItjCREoymEMc8fcfgXsRszLqi1J4L6EjGJzHvF27GnnrkjXvSBGAs7UTAZi?=
 =?us-ascii?Q?ZsPeYsoqVn7iPUgkU/Nlzm+YNKzjvixX0j8E6mxg7pB1o1AcpsdoY5Ja1Xz4?=
 =?us-ascii?Q?L8DgyYYdUB/csnvbVkCvlD3olr4bs1irN5OMh7u5jg/ItnyrK9thiiBIF8V4?=
 =?us-ascii?Q?FybMSoMNo/+LBlza1S072d31KH1QnO0Y5w0oMx5q60Bdwawu6aQbkcVyWcNM?=
 =?us-ascii?Q?84Bd73yG5VUWHjdY6ux4VRXM/FX79UEsp0HfbGOR5iEjzKBv/99F3YgDWF1s?=
 =?us-ascii?Q?kWFQ85VGRFku3bFk0ZRtsD5MLyqA42sld9kgsheSWOxsqUIy3PD5TeRsuZUp?=
 =?us-ascii?Q?5GL8G91o4vCY+T129SxQ4EAO159SAQtU8Muotnko76TtRVS3zY+8S5uJErr9?=
 =?us-ascii?Q?M43aTJsXIvPGVfd50u/JWORtvbfxN0AfXQU1KQkzFzRa623LSFvRhXuzWs7f?=
 =?us-ascii?Q?pO6a3yqx/cZYS0dpFthKGiNU/IVzIBFpyvWOg45Hjj4jC1ozz27huSQSHyPC?=
 =?us-ascii?Q?bihULzv94m//TZZRKVaLsObcyJRGu+cUWx6jHAQ2JnTBuPwrXsvE3O87MGZg?=
 =?us-ascii?Q?N/FQ42wMUy3kcPv/RMhZSAIH2UePz4dNkAUk8qR2LL9/ALwY8d9jUmlOfjuz?=
 =?us-ascii?Q?IuafZIwztmQ1ehBsFGcEYIZ2wOo53aVMnaOpbuvVHGPQQAMSOboqY8C5TF6o?=
 =?us-ascii?Q?41+htw2Dw57S4EvQ7m7YonP2DEkCvFGGytm6Rmjqe2q2ii5vO+XOb6W13Tpc?=
 =?us-ascii?Q?3iQQh51pxfxkPTzMH8O/KblZa4iX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2CTy+3xPgFnzqr6KGeoo5ES5Kd5bPbCp0YJrFuYIPVROPRRIrTUw4qN86sEV?=
 =?us-ascii?Q?zZyN0tDL+joWVbV83QOF5+c6rsTDAqLIyWyX4kIpRqyDIDzMrnKXB1PbFfuJ?=
 =?us-ascii?Q?coz5z7sGeLUvhioMoKu/oCeSWvZF3XhfYdom3GSpOecB1lL90Ti114ih75/w?=
 =?us-ascii?Q?gOARoeok9vkW1+r1cQ+5+azd5Zx3dyq6Y42Mp8peIDbMX0U4kQqZgk6SpfX6?=
 =?us-ascii?Q?xqm+evl2obtiA6Pyr5znI7W3yUUz8PRv26spbI5Wj5TxMxdk9J5dz4AzpGdJ?=
 =?us-ascii?Q?TKgKHGVrMSH64DL00ETI2Ezr2EBCyyKu8duyK8hajQ9Jx5JoMxSO0i8gF3mJ?=
 =?us-ascii?Q?ORyWsjzl8bUKIY/Ewlc4JFv26VuLrrdY2bduAjKjYk/M5rmXuq0YraAVyfe1?=
 =?us-ascii?Q?2YJWpWtiy7cjnuZg8FKR1Vh8gMIj7rjeOYoPyShoRReOvUfYlNE2iNjbc1Wj?=
 =?us-ascii?Q?c167ar8y0N81uHIn9cteI8sAmS8Ik464usdPyQvQRMsR9zmimZ61GInDEgrq?=
 =?us-ascii?Q?jtN6quqwrvRiT4hwaFnvNcSEeuCxce+AGUV0De4Bcy5Iw5aGoZ+XoPRO71Vg?=
 =?us-ascii?Q?I93MZ9MG+DYBdJNUz/X4PQ4nBnIlhueFhuBs1PsCDJAR81GicWbtKux7QK1c?=
 =?us-ascii?Q?EVlFul/8erV6qmZLEGqgsu3Qcp/6h+qN7yPiGi4U38/JibS3LV6coqXPcqxl?=
 =?us-ascii?Q?QI+lFlTdnzLv6FZrSFSLPxDLC5CN1PfRdY/eETC5AAZhmq5OzF7eX3m1a7Az?=
 =?us-ascii?Q?ugglNrbQPvrPPy4mhGj17MhY/YQyn54KE1Cw+wiCvNxESP7d2zZCtezfrteP?=
 =?us-ascii?Q?aRaTtQAZl8EOjvGnIxn/RihMj43MaqdcHUlqMwBA0U6EtLrbkHxI2qpr/uFA?=
 =?us-ascii?Q?b7taYr0GEfT5nGE9tdfz1llBs7CGMmz1e/VXWrrL31Xn6UcTSLsXcVIe+YYY?=
 =?us-ascii?Q?4F+V7bzU0zngalyIQViGBWQZdlWCxOM0Eh3LhS4Of7TEZsIfc6pqrM7Lpewj?=
 =?us-ascii?Q?1fug6X36kdbDGZ+5C8s8J6M3AzBUMtBZHA6QxtqB+F401uJVNHD7PmfKXX/K?=
 =?us-ascii?Q?dte+iFelv/UA80xElR9JT1waeB/p6FfWPCYu3VGhNiZgnJ5cNaBUUdybBFKT?=
 =?us-ascii?Q?allsJdC1+g8jgKZ/LceJLfvddeXahQaSJh3hnQI10brRAwTm4LtDlnefdyT8?=
 =?us-ascii?Q?X67Jc4c2UuNPT/GUH4mbroZ9UkAzwn5yvWo7G8GgRjRNY8FtbPalremyVNVD?=
 =?us-ascii?Q?5CFq4kw+zk0WzUv6ohfRi76IC3KsYR9mQ4QIvmiWoTJ4pyo5D4wg7qmoquT6?=
 =?us-ascii?Q?EdLM736K3IOpsz8m8/HYqGXcd5uy+jIP2haJHyc3ipmNVCNPsqffJTTQHG14?=
 =?us-ascii?Q?yVbNCjr4Q/tP2dJWTxIhXojDr2YmgiYCY4S+/eBKRhy1IqFP6j7N8gTOEQzd?=
 =?us-ascii?Q?APhKRbikhqvaeWOHiV1NHYAs+j96t+tZXTXUKKNBz5CdZ34oCp/MKZNpMvIL?=
 =?us-ascii?Q?eSplHZDiMPDmDiDshagB2zdJqQjtbjBsIt5kIPzyJPKy0RzNtZniIiVdbv1K?=
 =?us-ascii?Q?6r3vlSm3VUNzJrDIxCARWNrogzaVBO6c+6jhffmY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VaqFGoquFhSLYsMaFKt1dP6u178DX5xKz2X1GbuC/CSJH96ru1TW32HSfCF8p/0fHVXf9Z5VAQ+bjy2Hrg6LjHgruwXNHmktMf8XzhH5k9BOzcMPK9U6bRCAFcmr/ojTLA67XsTXEZqhPJAEs771YIK9voBaZUfIbLuG650onWYhGnmqkJz8W5mnz+vB6TzThbeYhOejVRbwelIQnL3abrzy08aKvzEes4MIgDCMP40EB0CQHFmJcB2qc56ZUVfbvJ3w3fUIbIPG0jsJp6rafEehKqEIgHaL0XFREnyzW1mJAfouGatoVdoIkhVE0UXKraJhx0Opf+fOqr2xStVhiMLSKxw5ldt7lv0O2FE6oRDyw6VgYARPt6hjsmWBX2KZahFZt2TPJ4HXKevPkR0knZzrUTjR6Db3x9Zx5n98Ivk6EpudCDY7Ua0ywFTsrO69pXczqlO1tQdqdsCM2DSTSCKhKlk09AupdqA+ek3zCTye2Em3mizSLN6Pccp4tZPPvyGKhyp2lM7lqMvh0YeVXiTB8YRxnrAJ1cdmkmPInSyhuQgj2DBfQiSddi6BDzMdKhmRbrC9XDO2sxuvhpn3u4c5fEUw5mys2VmxX/w+biE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fac8fc-aa27-4aad-60df-08dd6709a49b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:15:27.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyNa8GzYXD+/miJS6QiDdenfy9G1qdlw6mkLA13+zK8tHoDzuhtcr6rn35wii8m5YcXmOn23fI2NJ+d0pFMANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190116
X-Proofpoint-ORIG-GUID: AcgBQXzxdGE3cUjug7O8R-J3-VwzU5Tw
X-Proofpoint-GUID: AcgBQXzxdGE3cUjug7O8R-J3-VwzU5Tw

From: Eugene Loh <eugene.loh@oracle.com>

Various tests convert run-dependent values -- like PIDs and probe IDs
-- to run-independent strings before checking against their .r results
files.  But the conversions could be remarkably sensitive to the width
of probe IDs.  E.g., some conversions assumed probe IDs were flush with
the beginning of the line, but if they were narrower they were preceded
by white space and were not detected.  E.g., this happened in recent fbt
work, where probe IDs for fbt probes became much smaller in value.

Also, these conversions were being carried out by a hodgepodge of scripts
-- sed, awk, and grep;  some using run-independent strings like "NNN" or
"XXXX" instead of more informative "PID" and "PRID" strings;  some
incorrectly using "PID" for PRIDs, etc.

Replace these .r.p postprocessing scripts with a single script that is
more resilient to PRID widths and is commented.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/convert_PID_and_PRID.awk   | 20 +++++++++++++++++
 test/unittest/usdt/err.argmap-null.r          |  2 +-
 test/unittest/usdt/err.argmap-null.r.p        |  3 +--
 test/unittest/usdt/tst.dlclose1.r             |  8 +++----
 test/unittest/usdt/tst.dlclose1.r.p           | 13 +----------
 test/unittest/usdt/tst.enable_pid.r           | 22 +++++++++----------
 test/unittest/usdt/tst.enable_pid.r.p         |  8 +------
 test/unittest/usdt/tst.exec-dof-replacement.r |  2 +-
 .../usdt/tst.exec-dof-replacement.r.p         |  3 +--
 .../usdt/tst.multiprov-dupprobe-fire.r.p      |  3 +--
 test/unittest/usdt/tst.multiprov-dupprobe.r.p |  6 +----
 test/unittest/usdt/tst.multiprovider-fire.r.p |  3 +--
 test/unittest/usdt/tst.multiprovider.r.p      |  6 +----
 13 files changed, 44 insertions(+), 55 deletions(-)
 create mode 100755 test/unittest/usdt/convert_PID_and_PRID.awk
 mode change 100755 => 120000 test/unittest/usdt/err.argmap-null.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.dlclose1.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.enable_pid.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.exec-dof-replacement.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider-fire.r.p
 mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider.r.p

diff --git a/test/unittest/usdt/convert_PID_and_PRID.awk b/test/unittest/usdt/convert_PID_and_PRID.awk
new file mode 100755
index 000000000..1dbb31301
--- /dev/null
+++ b/test/unittest/usdt/convert_PID_and_PRID.awk
@@ -0,0 +1,20 @@
+#!/usr/bin/gawk -f
+
+# ignore the banner
+/^ *ID *PROVIDER *MODULE *FUNCTION *NAME *$/ { next; }
+
+# process other lines
+{
+	# convert run-dependent PID values to "PID"
+	$0 = gensub("prov([abc]?)[0-9]+", "prov\\1PID", "g");
+	sub("pid [0-9]+", "pid PID");
+
+	# convert run-dependent probe ID values to "PRID"
+	sub("^ *[0-9]+", "PRID");
+
+	# squash blanks
+	gsub(" +", " ");
+
+	# print
+	print;
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
index 215475e39..97b1850de 100644
--- a/test/unittest/usdt/err.argmap-null.r
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provPID:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
deleted file mode 100755
index c575983ad..000000000
--- a/test/unittest/usdt/err.argmap-null.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sed -rf
-s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.dlclose1.r b/test/unittest/usdt/tst.dlclose1.r
index 7873cb51f..70bb50d76 100644
--- a/test/unittest/usdt/tst.dlclose1.r
+++ b/test/unittest/usdt/tst.dlclose1.r
@@ -1,6 +1,4 @@
-started pid NNN
- ID PROVIDER MODULE FUNCTION NAME
-NNN test_provNNN livelib.so go go
- ID PROVIDER MODULE FUNCTION NAME
+started pid PID
+PRID test_provPID livelib.so go go
 -- @@stderr --
-dtrace: failed to match test_provNNN:::: No probe matches description
+dtrace: failed to match test_provPID:::: No probe matches description
diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
deleted file mode 100755
index 85725f3bb..000000000
--- a/test/unittest/usdt/tst.dlclose1.r.p
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/usr/bin/gawk -f
-{
-	# ignore the specific probe ID or process ID
-	# (the script ensures the process ID is consistent)
-	gsub(/[0-9]+/, "NNN");
-
-	# ignore the numbers of spaces for alignment
-	# (they depend on the ID widths)
-	gsub(/ +/, " ");
-
-	print;
-}
diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose1.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.enable_pid.r b/test/unittest/usdt/tst.enable_pid.r
index 675fcdd6f..9241202d7 100644
--- a/test/unittest/usdt/tst.enable_pid.r
+++ b/test/unittest/usdt/tst.enable_pid.r
@@ -1,14 +1,14 @@
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
-                   FUNCTION:NAME
-                        :tick-1s 
+ FUNCTION:NAME
+ :tick-1s 
 
 done
 ========== out 1
@@ -39,7 +39,7 @@ is not enabled
 === epoch ===
 success
 -- @@stderr --
-dtrace: description 'test_provNNN:::go ' matched 1 probe
-dtrace: description 'test_provNNN:::go ' matched 2 probes
-dtrace: description 'test_provNNN:::go ' matched 2 probes
+dtrace: description 'test_provPID:::go ' matched 1 probe
+dtrace: description 'test_provPID:::go ' matched 2 probes
+dtrace: description 'test_provPID:::go ' matched 2 probes
 dtrace: description 'test_prov*:::go ' matched 3 probes
diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
deleted file mode 100755
index baf9d2a90..000000000
--- a/test/unittest/usdt/tst.enable_pid.r.p
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/usr/bin/awk -f
-{
-	# ignore the specific process ID
-	gsub(/test_prov[0-9]+/, "test_provNNN");
-
-	print;
-}
diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r b/test/unittest/usdt/tst.exec-dof-replacement.r
index 7547f85e5..226ab7c8a 100644
--- a/test/unittest/usdt/tst.exec-dof-replacement.r
+++ b/test/unittest/usdt/tst.exec-dof-replacement.r
@@ -1 +1 @@
-PID test_prov test2 main succeeded
+PRID test_provPID test2 main succeeded
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
deleted file mode 100755
index 1a5871f73..000000000
--- a/test/unittest/usdt/tst.exec-dof-replacement.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-grep -v '^ *ID' | sed 's,^[0-9]*,PID,; s,prov[0-9]*,prov,g; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.exec-dof-replacement.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
deleted file mode 100755
index bdbce0189..000000000
--- a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
deleted file mode 100755
index 5d11db2d4..000000000
--- a/test/unittest/usdt/tst.multiprov-dupprobe.r.p
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-# Remove banner.
-# Replace numerical values with generic PRID and PID labels.
-grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
deleted file mode 100755
index bdbce0189..000000000
--- a/test/unittest/usdt/tst.multiprovider-fire.r.p
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
deleted file mode 100755
index 5d11db2d4..000000000
--- a/test/unittest/usdt/tst.multiprovider.r.p
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-# Remove banner.
-# Replace numerical values with generic PRID and PID labels.
-grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
new file mode 120000
index 000000000..11a06e058
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r.p
@@ -0,0 +1 @@
+convert_PID_and_PRID.awk
\ No newline at end of file
-- 
2.43.5

