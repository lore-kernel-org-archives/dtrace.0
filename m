Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1311CBA
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771645588; cv=fail; b=P/Ya6tipv+MIoEF0zl0WqNk3H41y+iES0eVWuP0khpEGaWpwUwruGZWo31THbEZMGSdblQokOhqYTUDgec9HxiGjHt3/5m2MRGDeIAy1EqWLD/mEskNn2YsAQzZswriJzhodbF/mzP+3GsqmRv2UZBFoIRo1EyFF3PwGfAiAwJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771645588; c=relaxed/simple;
	bh=CEXOFp0mfLbxBMqmaoyZ6lIPlkwilFJefUfhgswNUN8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Wrj0aXaHKQFvULV0I5oksnCerNH43Ffh2mqrAggT1RV/iG0TncVo6mnifbtQ+mQjmtH1IUbCkDe+Fnq0xUkUJZGGX/OdYG8AVVQE7+DAGce3CVg5OO7Zi0Qmu+wvH+VGABDL0psa9j7uMwF3vv9BAwfjRxn6iHhiHalD/I2CtvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UKjIcctR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MNrSU86C; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UKjIcctR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MNrSU86C"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L3hGsu808538
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 03:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NKFKqDhLj9SAuTUb6ASC5VJY7+injVH0UgHefF6J1gc=; b=
	UKjIcctR0qgGHBOnxYE4xnVA/ABKBghBSh/qN9jQGfpDVoQTptQKFyoNnaRffQRT
	3SGWURrTqzEqkJx3WfIrRbTprncxZQZ9pXeXAcwUOHybMmgITXsp1oz07Beeg5Xm
	j4FUUps8eynaqhAdmg5ud3D1tCPShuvevt4azYHWM4ZdRRVsLUcHlay3txGAJiHF
	J18T2YKcrzeMrkYp9MNV427lYt1qNN1dYOOxSxo2/07zSnvqEqwsR6S8g54uCgPR
	c+NG0n9G77Gprn6EDc0owByxf9mzRjObcAKuFCaJuagn+oCON/2PK8GS5loN2x12
	9TZgnclqqM2jZzRUJVFpCQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4ar80mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 03:46:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61L1Y2xR027872
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 03:46:24 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35bj7x6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 03:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUmMrbiBK4afns0UlZHDyTU0R3IzcBOKOpbDHY8AD/RJ3+itS6tsRI1EVO4JeMf52pftXvgBgUSZqescFFhCacBpKe7p7plArUk9eYd2/CMFAPjR9cgqu/Gi4G8r6hEslMr+VgrCwHku3OGgvY8mXe4V+iDJR8zvGfNCNsPfZ6DbRI2Onu2PgdFJn7eD2zpnu702890l4fmntOzp+rxXohLPo7arrq0Waqplq5goWoWA5zxFiupZ/cLBp2BuqMljiGohOjZvJ0bEqkHShHrZYOVzJLYp5v/sVa2Oaj6QqV/uN2eBaJhRnqEEMLUEHmR6Eriu+4q4ejQ4XMnGs2yvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKFKqDhLj9SAuTUb6ASC5VJY7+injVH0UgHefF6J1gc=;
 b=eK7NdIdtpx62KWeeHorTdh/t8mkYnQJUB1Z6FZT5T9EZxyFPgAZsiEAdD0QFZPsevrNI9twUbUE+JYXjJ0jKhcRDDlrzM/FMA7h9V6j/mWAlaK+cYjebjEwsn4lyDkPuJoI/SIUjO7EViyFIiHuO1xD66Nz72xjSPa0JHZcPRKlhQvjbPeggWAmoZk0g0MskKiDCzmYkpQD9kIrq5u8tCXXInJmY0DDYTxD6jtGPKJzuJmaObRCgxT2BNC5jtxrwnbvh39vm1IgTOhBOTGavEN2LJ9vAyjJ+bHfLzoEcggmiEI10gSyFt/g5JClOc/rPKifBxHPRChFpH6/MJn3Fdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKFKqDhLj9SAuTUb6ASC5VJY7+injVH0UgHefF6J1gc=;
 b=MNrSU86CfMWf+Vgjz2ALIYqXfqIOa8hogyNXeFZEsU/luCNc3Www1UNsqwBm+fqEni8QI6C9/EYsS7oAvPLJYh3Cex6gaCywFMU/DOr88djH9ToF2Kc0hdeIS1xvvfJLFr6c4yaJekcHLVHZ0VNo4LRY2OfEmk/AC8u3C4IE3pg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7060.namprd10.prod.outlook.com (2603:10b6:a03:4d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 03:46:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Sat, 21 Feb 2026
 03:46:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix flowindent for "return" probes with multiple statements
Date: Fri, 20 Feb 2026 22:46:18 -0500
Message-Id: <20260221034618.14035-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0010.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f07cdb-1d61-4a77-0d7f-08de70fbc6ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+tit4CwXd2BNkoo1bPvaSlLblBaUa71syNVebliTYn9KXEbCbMbg9pUXG1eB?=
 =?us-ascii?Q?fuGehwUSjabmzMDDagbXN/h90tNYuPhwge+b3dGGU+kfcSlpSQoyQZh4q03F?=
 =?us-ascii?Q?/8OSrMrsiM7gp2pDy/VXu1FwJ6SNoTOGIC4rW/gxs2flntT8JO3ulqCQy8gR?=
 =?us-ascii?Q?+L1AMlt/nfW5yEliqprHUhO7b/FSY2CS5rJmXLCzf617AJttq1T7ZTP43DVM?=
 =?us-ascii?Q?L27/9ajxxLH9XcoeGL/mYfQcxGcR970p1wZBH/q5jJKo5c2mH6jDgjDwdJXw?=
 =?us-ascii?Q?pf8xHjUbfJ5HOpIG3sdb8yyXHX0AdiTC1ogVZG9tODfe72UZHHKLQrSRDlPt?=
 =?us-ascii?Q?IefFVcwPUnWDHjmDf9UcC35F8hEtgm6eaqVg3qMMmn86elWsJTAKyFDVyYw4?=
 =?us-ascii?Q?A9qJFa6RR7gez/DGtECfLESDVZ6QkpYzVhxCLt32lYHOjFcPqRj6eKabco1a?=
 =?us-ascii?Q?tBwl7/kLZfPT/xT+Ue5gVkAW6kXTxappHzfSpQTzypBStZtEN3nlgs0juRic?=
 =?us-ascii?Q?tMEn1UEi/E+2HptpoqUFOoSeRVxxAihH5Lm1+h8N3JhVe2ZYloFIgQc5Y6Im?=
 =?us-ascii?Q?tsn8ySFs4bkuO5ftB4LgTCGww2MKTBb0sD5UAdje13SP4G3/BOwbY8BiTMUY?=
 =?us-ascii?Q?OJL413sY0qd3ZU2yYQT9KI63xiwewmKmUNlTjSSzI6r9pzOUBifxigQTMRe7?=
 =?us-ascii?Q?dLOrgzYuLgOfjV3XDBF4SR71v17EJs/ptrWKAvBK2qafTGn/Z1e8JkV/5owS?=
 =?us-ascii?Q?UC4TdgmQxorWbVARAOqXFRUiP5Rk2+2gvosV/EtfWSIXoJUz/55rHPQ8XC5g?=
 =?us-ascii?Q?Sk8Xuybai2juF3dpuSkpgp/T18ooeN0GFf37LCAUBfrEZtGS7lcYTgSHUcFw?=
 =?us-ascii?Q?8nJ+gxjok/OTQCNxKySP2EQV/llbJe/OJHiSJk3dWqMBCXGudh2bqDqYqcBb?=
 =?us-ascii?Q?BibNZ9Lz+YPZlHaYeSPXE/+CqokrKjYXZNmEl67ukurYgbC5YK94PXtgXT9o?=
 =?us-ascii?Q?Z7tdp1V/9tgW4HJmlWFENS6RQcvv6ZYL8GyJ4lZmE9xkBrgPcACheASf+mCg?=
 =?us-ascii?Q?yyLGhzoVVLnwRab5KEGXOBAdcgErW68VYg1/VfRDjpsEAPzl/ki7Fkbmm1oH?=
 =?us-ascii?Q?5TzJIHwDC1RMsz+nBD6PNhO3hb8zO3W8GhT8QmoA3qZQQ9glzoUYCysgBZ0S?=
 =?us-ascii?Q?2jPhJI/5cpfCOHlFVqYjbh11gMxsd9HRmxMsBJrnYv6mKG25SPsi+Y0aDqhH?=
 =?us-ascii?Q?3jUVteuX9eeDcQwNP+Q15ddDl8NXAPQrLVLmd8KgR+NEZ7FKFUQmUOHRRVm+?=
 =?us-ascii?Q?tDVryhzCjwAEZBCJWifLP8YffO2IiaEp7qWpTFk0jA2jJQMeAmgLa/9lV//j?=
 =?us-ascii?Q?CT1KFr8uXbaoV6Hy3jNqvIghZYcxXXsv7BPxmKf406gQxHKhQs2XTm85efYg?=
 =?us-ascii?Q?fXOlruQ4GTG7oXLPccYpOLkeodiIVt95yRp9bJ8lHXPHHe9eYpggKMB/riwQ?=
 =?us-ascii?Q?26wc3bN2OTWWeKshGzinxl58GomiI2JoS4svuyeIszhrFZt+58m4AhEz7bhr?=
 =?us-ascii?Q?PLI05Z+0NsE2DCuIhtV77TJHaqMuEigNHBDjzrff?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r0N4158dT3ULTqS1S6cAhOUGtct69FJZHV/E3SsYzVrKmMc90fdEKlLE363e?=
 =?us-ascii?Q?zUelJawyjpF8afnUl+ho9+f+dD/Lov8aef7jZU2csJ/QKWEMEa/67DipC3Gx?=
 =?us-ascii?Q?MLOLMdYPsv/QPBswdWxanlabF9FQwpE/0AwFt0MBl+lUHSr4PvDHuwSLQo3f?=
 =?us-ascii?Q?BBuonNJ32qUjT1i5+WFsPPV013y3G+3leSfR83CElUnRhmHqmtzhWNhq+/f1?=
 =?us-ascii?Q?6F0TBcAFW3MRao5f8IqdEx8cb79qT7BpEB6frEd668obyapEmbq+CkN9zNDJ?=
 =?us-ascii?Q?q9zCp3+4E3GV89T0318RI40JKA4oTnAGmjE5kA/PkhH3LDPgaAnK24rNMHtj?=
 =?us-ascii?Q?Lt+mc2T/AYXayOo4JEBIuVx8k0Fm8zD90EZyxD2k6u6wU1vCM+nofl0SSRTH?=
 =?us-ascii?Q?ddr6q0DELTDi/+kRHzWfPqnZmECoUQrXDEPPo/TF0vguYghgTx8sNyrqrkMw?=
 =?us-ascii?Q?7pCnTLKrA+KcDtx7+qezZSAQe3OOXCiYTPY85KqCy+bTZABt59DMsfFpmcpk?=
 =?us-ascii?Q?BoqSRR5edIaahYRpMYTQ5I8TC8snVNryWsYX4fzOKnwD/Bc10Nj1/VC43+3r?=
 =?us-ascii?Q?DZfGwCPHadaHneWjPdc3PkfQ/NTdMhzM3t0wjIX0+9UEMHq0NQWN2tPIrUJL?=
 =?us-ascii?Q?qCaGxekXMr8Y2xqTz6zow43GieVzZcdDUTdfL5jEgyCSgKb6Pv/2AhXenSSg?=
 =?us-ascii?Q?EQgYhgqBbXuRXYyOkPhrqneeSuX6kaAoJKAsK1cAAUcYfbrNP8qIxaHL+r85?=
 =?us-ascii?Q?fLwxGCg7hyAKtNbcS66sSOTYJlwnWRLLJemjl7/Gxx20CWAnt1wL+V3GtU9O?=
 =?us-ascii?Q?4gY3QiVv5yg82YhujdjeT3RgBphua2cae7Ia3gUeB4SjsV0eR7OG5ql2oJVK?=
 =?us-ascii?Q?q5XfaJfi+M8GpbtNZJkR4O8dMqk1C/7cV0FWKEdKUNVPHCWohAWoNQ+y095v?=
 =?us-ascii?Q?xwUBaIABrGjKEgirIvs8c4C0JDCFkRso4AEXvkfqhyWGSfzzmjfdYjMY9YOk?=
 =?us-ascii?Q?VlRJA9ZsIxNuddzTeYg0txW34viLXTIdVKaIHRzgU8gZnNin03l/HEvW6CQX?=
 =?us-ascii?Q?5NtHknhcuXj2O1oKIu0Q9NWsKYOyPaeSKm3tbDqSThA6qccLRzgLtMbVwC8C?=
 =?us-ascii?Q?OzyAXrcfsxKuihyMvqx5IylYdQNBRUmN1uLEMs52OgRcu1J9xtS7AdJyS4cW?=
 =?us-ascii?Q?4GhG78RR8dnFSupkk5PSGJfrT0Cukbi5K9kt7BlSYVMNQjt6/lqK3fOSj0QW?=
 =?us-ascii?Q?gu0+IFzYzuGnkyf6RBtY/TKZFv+1Wv+4kM0RzdlBXVvxfjzDHBwpl5ClxFD5?=
 =?us-ascii?Q?Xl+0kzjFsckHm5/oQk9W2Rhdkxkm6IavUFWtabfKt/fwZJ6zLB3c7xVwehZs?=
 =?us-ascii?Q?9aqhUuHPfZUsUQal6a8kmeJMeE9ssL4fnTtKKrmRkBoUkAOp2VACZ6aGTgIw?=
 =?us-ascii?Q?Ms4EY5AxQ3SU0A3NC9l/b60fsRrC5b9BKQd1fo6wcxy0QjIbzKnfWlfjhfDY?=
 =?us-ascii?Q?BhDPNs99Qa9PKAslreV5Dbe0YucQI0smPtuKr90li9j7CrbnMEMD5wscQo3U?=
 =?us-ascii?Q?j/IkTg55T1dl214sHiSb/CpCAz8CddII1v6vSwJR99cCnCyP2m3O38g56aIs?=
 =?us-ascii?Q?a3PVmPwWFEZI3XglWsWgDP/akaj2hiuUGzi3pUmiL8ZTGG0IzB4VLU8yIU6o?=
 =?us-ascii?Q?We7mobM/5Yr/ZbyHk9Kgs8BzwHQPe+oiUBslgUGWaRTKK2Fd3TkMHiysVgTf?=
 =?us-ascii?Q?H9r4UQdi6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5G5rbeJ1osod+kN8aV86lGkFR72CDxqnsVehb9jHwpXO1cmljUqYOF2iwpa8C3muhPapru5Tr0w0A/Ofdpwpxbs3I32encLOZP5cr/AV8cj/FSNp/bC0HSo1Zoqf21wWPMIQwCAIYDCveYTGe5ekj4rExMvW50NH3039SgSuYqHvHrCsw9GT2tTzNuIhxI0mNRL2DMd4QCxsdoYEr/egP6ca5tKJRpVo/OY577n9VUdx/r0UNDZLvZgrfsHXyyzZvYCIOFEOAUz/Z4vepvmxFSc2FTsTCOrzvAMdvipY524h0wGiD5smjU452+e8CXGY1scMdI13gOMGIoo56Bf+gmj5hgHxGP+jNL4Kn5ENM8x9WBonZD8R2lLjPWx1tN7yCepOhdsUelUcY6tmXbfK66dvyMdhucqH9yNIrPV9Xsf8empqRyTMjGC/FF/mSHq8sqaFcIjrnIDN2RZ/8pPd7FFd1xyh3tjvhQ/WLYlsPCFs3ETL9dMtF46m8TqBgm0eguDh1qut5cW2xit76U3uqJSPKYAikGeNQ6IqvM0VnJ1LxIXj0BxW7il3aRQQ9q+6K8PTEOy8mUEaXPeAxmQamX6BqYOKVlaJFy4yobmKx0c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f07cdb-1d61-4a77-0d7f-08de70fbc6ed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 03:46:21.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rvL0dFiq29mZUrIf8KFNEjoU2+kYL6KtWY5JnyCBoOqp1gogGyUfUMlRYTv0UHKl5jNLmAukqfa6AEvZYI4+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7060
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602210037
X-Authority-Analysis: v=2.4 cv=La0xKzfi c=1 sm=1 tr=0 ts=69992a90 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=-Nk1BllfUr-ncC-c0I4A:9 cc=ntf
 awl=host:12262
X-Proofpoint-ORIG-GUID: IZHsvnpKGI4vuXnkVkLFKEareWYsu-ub
X-Proofpoint-GUID: IZHsvnpKGI4vuXnkVkLFKEareWYsu-ub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAzNyBTYWx0ZWRfX/U+1PIVN2LxT
 GiMCmd/QmyEZNBYO3VrtFHl9579okGoe+0Ch/NfDOYbUCLeqgTtiTcXrqcD2es7Wwze9HO9aGKc
 L2VTa2tJ4jUSOfrMag0+BkkVBdSi2phn2sU9MQTc0cYN9KP0CzCnXgiy9gvopuiQ0yUxzOdAA/A
 o8EuJDGGdtoksCDbHXPMAfuB59NMG4PNsvhYSM05DrFteVuyEd1BYQALwYkg87TVftptK9ztkBD
 /sADQKe5MtMkvzxJqv6ITd+PSfqwwQkBOqvdNvvimWwrKdA76XnjDcD/G2XlzMPdN4Jlm44cPLZ
 yHVLD0Dd06CUkRxR1Y1cLUzq3J3lx5iDLy+vAYa5CPMmAvMds2PeFUFlSkA5tulkT8C8aQiMxfD
 aiPPdzVFCcKADzlCYDz2uTvSIXfDdwJ0r0pqaDHK4rQ8l+qxo2qsOrmFgYgPuCY6eNK5+S9bVVE
 ejsIUt+wWHfjY30IFVJVmc450T2xS9HttCWv3AbM=

From: Eugene Loh <eugene.loh@oracle.com>

The flowindent algorithm should change indentation based only on the
number of levels of entry and return.  So, if an entry or return probe
has multiple statements, the indentation should change only for the
first statement.

Such logic is used for entry probes.  Similar logic should be used for
return probes.

Add a test to cover the case of multiple statements per entry and return
probes.  Also have it check a greater number of indentations.  Since
the new test supersedes the old ones, remove the old tests, which
were fickle anyhow.  The new test can still fail -- the flowindent
algorithm is not completely robust -- so allow reinvocation in case of
failure.  The intermittent failures of flowindent tests have long been a
testing irritant.  Now, with reinvocation, testing shows no failures in
100 iterations on over a dozen systems.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c                        |  11 +-
 test/unittest/options/tst.F.aarch64.r         |   1 -
 test/unittest/options/tst.F.d                 |  36 ----
 test/unittest/options/tst.F.r.p               |   1 -
 test/unittest/options/tst.F.x86_64.r          |   1 -
 .../unittest/options/tst.flowindent.aarch64.r | 160 ----------------
 test/unittest/options/tst.flowindent.d        |  36 ----
 test/unittest/options/tst.flowindent.r        |   1 +
 test/unittest/options/tst.flowindent.r.p      |   7 -
 test/unittest/options/tst.flowindent.sh       | 171 ++++++++++++++++++
 test/unittest/options/tst.flowindent.x86_64.r | 160 ----------------
 11 files changed, 176 insertions(+), 409 deletions(-)
 delete mode 120000 test/unittest/options/tst.F.aarch64.r
 delete mode 100644 test/unittest/options/tst.F.d
 delete mode 120000 test/unittest/options/tst.F.r.p
 delete mode 120000 test/unittest/options/tst.F.x86_64.r
 delete mode 100644 test/unittest/options/tst.flowindent.aarch64.r
 delete mode 100644 test/unittest/options/tst.flowindent.d
 create mode 100644 test/unittest/options/tst.flowindent.r
 delete mode 100755 test/unittest/options/tst.flowindent.r.p
 create mode 100755 test/unittest/options/tst.flowindent.sh
 delete mode 100644 test/unittest/options/tst.flowindent.x86_64.r

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 8e9b01cb6..d3cdcc2fc 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -475,17 +475,14 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_id_t lastprid,
 	}
 
 	/*
-	 * If we're going to indent this, we need to check the ID of our last
-	 * call.  If we're looking at the same probe ID but a different STID,
-	 * we _don't_ want to indent.  (Yes, there are some minor holes in
-	 * this scheme -- it's a heuristic.)
+	 * If we're looking at the same probe ID but a different STID,
+	 * we do NOT want to change indentation.  (This heuristic could fail.)
 	 */
-	if (flow == DTRACEFLOW_ENTRY) {
+	if (flow != DTRACEFLOW_NONE)
 		if (stid != laststid && pd->id == lastprid)
 			flow = DTRACEFLOW_NONE;
-	}
 
-	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
+	if (flow != DTRACEFLOW_NONE)
 		data->dtpda_prefix = str;
 	else
 		data->dtpda_prefix = "| ";
diff --git a/test/unittest/options/tst.F.aarch64.r b/test/unittest/options/tst.F.aarch64.r
deleted file mode 120000
index 802f9b829..000000000
--- a/test/unittest/options/tst.F.aarch64.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.aarch64.r
\ No newline at end of file
diff --git a/test/unittest/options/tst.F.d b/test/unittest/options/tst.F.d
deleted file mode 100644
index 90430868e..000000000
--- a/test/unittest/options/tst.F.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The -F option enables entry/return matching output.
- *
- * SECTION: Options and Tunables/Consumer Options
- */
-
-/* @@runtest-opts: -FZ -xswitchrate=1s */
-/* @@timeout: 15 */
-/* @@trigger: readwholedir */
-
-BEGIN
-{
-	i = 0;
-	j = 0;
-}
-
-syscall::read:
-/pid == $target/
-{
-	printf("syscall: %d\n", i++);
-}
-
-fbt:vmlinux:SyS_read:,
-fbt:vmlinux:__arm64_sys_read:,
-fbt:vmlinux:__x64_sys_read:
-/pid == $target/
-{
-	printf("fbt: %d\n", j++);
-}
diff --git a/test/unittest/options/tst.F.r.p b/test/unittest/options/tst.F.r.p
deleted file mode 120000
index 6260a34c1..000000000
--- a/test/unittest/options/tst.F.r.p
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.r.p
\ No newline at end of file
diff --git a/test/unittest/options/tst.F.x86_64.r b/test/unittest/options/tst.F.x86_64.r
deleted file mode 120000
index 509d38a69..000000000
--- a/test/unittest/options/tst.F.x86_64.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.x86_64.r
\ No newline at end of file
diff --git a/test/unittest/options/tst.flowindent.aarch64.r b/test/unittest/options/tst.flowindent.aarch64.r
deleted file mode 100644
index 7e745280e..000000000
--- a/test/unittest/options/tst.flowindent.aarch64.r
+++ /dev/null
@@ -1,160 +0,0 @@
- => read                                  syscall: 40
-
-   -> __arm64_sys_read                    fbt: 40
-
-   <- __arm64_sys_read                    fbt: 41
-
- <= read                                  syscall: 41
-
- => read                                  syscall: 42
-
-   -> __arm64_sys_read                    fbt: 42
-
-   <- __arm64_sys_read                    fbt: 43
-
- <= read                                  syscall: 43
-
- => read                                  syscall: 44
-
-   -> __arm64_sys_read                    fbt: 44
-
-   <- __arm64_sys_read                    fbt: 45
-
- <= read                                  syscall: 45
-
- => read                                  syscall: 46
-
-   -> __arm64_sys_read                    fbt: 46
-
-   <- __arm64_sys_read                    fbt: 47
-
- <= read                                  syscall: 47
-
- => read                                  syscall: 48
-
-   -> __arm64_sys_read                    fbt: 48
-
-   <- __arm64_sys_read                    fbt: 49
-
- <= read                                  syscall: 49
-
- => read                                  syscall: 50
-
-   -> __arm64_sys_read                    fbt: 50
-
-   <- __arm64_sys_read                    fbt: 51
-
- <= read                                  syscall: 51
-
- => read                                  syscall: 52
-
-   -> __arm64_sys_read                    fbt: 52
-
-   <- __arm64_sys_read                    fbt: 53
-
- <= read                                  syscall: 53
-
- => read                                  syscall: 54
-
-   -> __arm64_sys_read                    fbt: 54
-
-   <- __arm64_sys_read                    fbt: 55
-
- <= read                                  syscall: 55
-
- => read                                  syscall: 56
-
-   -> __arm64_sys_read                    fbt: 56
-
-   <- __arm64_sys_read                    fbt: 57
-
- <= read                                  syscall: 57
-
- => read                                  syscall: 58
-
-   -> __arm64_sys_read                    fbt: 58
-
-   <- __arm64_sys_read                    fbt: 59
-
- <= read                                  syscall: 59
-
- => read                                  syscall: 60
-
-   -> __arm64_sys_read                    fbt: 60
-
-   <- __arm64_sys_read                    fbt: 61
-
- <= read                                  syscall: 61
-
- => read                                  syscall: 62
-
-   -> __arm64_sys_read                    fbt: 62
-
-   <- __arm64_sys_read                    fbt: 63
-
- <= read                                  syscall: 63
-
- => read                                  syscall: 64
-
-   -> __arm64_sys_read                    fbt: 64
-
-   <- __arm64_sys_read                    fbt: 65
-
- <= read                                  syscall: 65
-
- => read                                  syscall: 66
-
-   -> __arm64_sys_read                    fbt: 66
-
-   <- __arm64_sys_read                    fbt: 67
-
- <= read                                  syscall: 67
-
- => read                                  syscall: 68
-
-   -> __arm64_sys_read                    fbt: 68
-
-   <- __arm64_sys_read                    fbt: 69
-
- <= read                                  syscall: 69
-
- => read                                  syscall: 70
-
-   -> __arm64_sys_read                    fbt: 70
-
-   <- __arm64_sys_read                    fbt: 71
-
- <= read                                  syscall: 71
-
- => read                                  syscall: 72
-
-   -> __arm64_sys_read                    fbt: 72
-
-   <- __arm64_sys_read                    fbt: 73
-
- <= read                                  syscall: 73
-
- => read                                  syscall: 74
-
-   -> __arm64_sys_read                    fbt: 74
-
-   <- __arm64_sys_read                    fbt: 75
-
- <= read                                  syscall: 75
-
- => read                                  syscall: 76
-
-   -> __arm64_sys_read                    fbt: 76
-
-   <- __arm64_sys_read                    fbt: 77
-
- <= read                                  syscall: 77
-
- => read                                  syscall: 78
-
-   -> __arm64_sys_read                    fbt: 78
-
-   <- __arm64_sys_read                    fbt: 79
-
- <= read                                  syscall: 79
-
diff --git a/test/unittest/options/tst.flowindent.d b/test/unittest/options/tst.flowindent.d
deleted file mode 100644
index 1ce1e26f7..000000000
--- a/test/unittest/options/tst.flowindent.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The -xflowindent option enables entry/return matching output.
- *
- * SECTION: Options and Tunables/Consumer Options
- */
-
-/* @@runtest-opts: -xflowindent -Z -xswitchrate=1s */
-/* @@timeout: 15 */
-/* @@trigger: readwholedir */
-
-BEGIN
-{
-	i = 0;
-	j = 0;
-}
-
-syscall::read:
-/pid == $target/
-{
-	printf("syscall: %d\n", i++);
-}
-
-fbt:vmlinux:SyS_read:,
-fbt:vmlinux:__arm64_sys_read:,
-fbt:vmlinux:__x64_sys_read:
-/pid == $target/
-{
-	printf("fbt: %d\n", j++);
-}
diff --git a/test/unittest/options/tst.flowindent.r b/test/unittest/options/tst.flowindent.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/options/tst.flowindent.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/options/tst.flowindent.r.p b/test/unittest/options/tst.flowindent.r.p
deleted file mode 100755
index 1c6489608..000000000
--- a/test/unittest/options/tst.flowindent.r.p
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/usr/bin/gawk -f
-
-# Report only from 40 to 80.
-BEGIN { report = 0 }
-$NF == 40 { report = 1 }
-$NF == 80 { report = 0 }
-report == 1 { print }
diff --git a/test/unittest/options/tst.flowindent.sh b/test/unittest/options/tst.flowindent.sh
new file mode 100755
index 000000000..bcd5900bf
--- /dev/null
+++ b/test/unittest/options/tst.flowindent.sh
@@ -0,0 +1,171 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# @@reinvoke-failure: 1
+
+dtrace=$1
+
+DIRNAME="$tmpdir/flowindent.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create the trigger.  Produce the following call stack 3 times:
+#         main()
+#           -> foo1()
+#             -> foo2()
+#               -> foo3()
+#                 -> foo4()
+#                   => syscall::write
+#                     -> fbt:vmlinux:__*_sys_write
+
+cat << EOF > main.c
+#include <stdio.h>
+
+int foo4(int x) {
+	printf("%d", x);
+	fflush(stdout);   /* prevent buffering the printf */
+	return x + 1;
+}
+
+int foo3(int x) { return foo4(x) + 1; }
+int foo2(int x) { return foo3(x) + 1; }
+int foo1(int x) { return foo2(x) + 1; }
+
+int main(int c, char **v) {
+	int iter, value = 0;
+	for (iter = 0; iter < 3; iter++) {
+		value = foo1(value);
+	}
+	return 0;
+}
+EOF
+
+$CC main.c
+if [ $? -ne 0 ]; then
+	echo ERROR: compilation
+	exit 1
+fi
+
+# Run with flowindent, equivalently specifying either -F or -xflowindent.
+# Ignore the trigger (a.out) output.
+# Use a long switchrate to reduce the chances of interruption from dt_consume_cpu(),
+# which resets the flowindent algorithm.
+
+for my_opt in "-F" "-xflowindent" ; do
+	$dtrace $dt_flags -c "./a.out > /dev/null" $my_opt -xswitchrate=1s -Zqn '
+	/*
+	 * Probe on each foo* entry and return.
+	 * Report the cpu for more debugging in case of failure.
+	 */
+	pid$target::foo*:entry,
+	pid$target::foo*:return { printf("%d foo\n", cpu); }
+
+	/*
+	 * Add a second statement for those foo* probes.
+	 */
+	pid$target::foo*:entry,
+	pid$target::foo*:return { printf("%d foo again\n", cpu); }
+
+	/*
+	 * And add some syscall and kernel probes.
+	 */
+	syscall::write:,
+	fbt:vmlinux:__arm64_sys_write:,
+	fbt:vmlinux:__x64_sys_write:
+	/pid == $target/
+	{
+		printf("%d write\n", cpu);
+	}' >> D.out 2>&1
+
+	if [ $? -ne 0 ]; then
+		echo ERROR: D script
+		exit 1
+	fi
+done
+
+# Construct the file to compare D output.  Note:
+#   - Each entry/return changes indentation only once,
+#       even if there are multiple statements per probe.
+#   - The syscall entry/return uses => and <=.
+# Each iteration happens to have 20 lines of output.
+# There are 2 runs (-F and -xflowindent).
+# Each run has 3 iterations, but we will discard the first one.
+# So the cmp file has 2*(3-1) = 4 iterations in total.
+
+for iter in `seq 4`; do
+cat << EOF >> D.cmp
+ -> foo1                                  foo
+  | foo1:entry                            foo again
+   -> foo2                                foo
+    | foo2:entry                          foo again
+     -> foo3                              foo
+      | foo3:entry                        foo again
+       -> foo4                            foo
+        | foo4:entry                      foo again
+         => write                         write
+           -> write                       write
+           <- write                       write
+         <= write                         write
+       <- foo4                            foo
+      | foo4:return                       foo again
+     <- foo3                              foo
+    | foo3:return                         foo again
+   <- foo2                                foo
+  | foo2:return                           foo again
+ <- foo1                                  foo
+| foo1:return                             foo again
+EOF
+done
+
+# Postprocess the D output.
+
+awk '
+# If there is a break in the output, restart the line number.
+NF == 0 || /FUNCTION/ { lineno = 0; next }
+
+# Increment the line number.
+{ lineno++; }
+
+# We do not want to be interrupted by dt_consume_cpu() calls.
+# Therefore we use a long switchrate to throttle the consumer.
+# Since throttling does not start immediately, however, we also
+# discard the first iteration of output in each run.  We saw
+# earlier there are 20 lines of output per iteration.
+lineno <= 20 { next }
+
+# Then print.  The cpu IDs are removed for the sake of comparison.
+# The cpu IDs were printed in the first place since it is possible
+# that the trigger migrates from one cpu to another, disrupting the
+# flowindent algorithm.  That is unlikely for such a short-running
+# program.  Still, if we get unlucky, at least there is more data
+# for debugging.  If migration proves to become an issue, consider
+# using taskset to bind the trigger to a cpu.
+{
+	sub(/__arm64_sys_write/, "write            ");  # scrub arm64 label
+	sub(  /__x64_sys_write/, "write          "  );  # scrub   x64 label
+	sub( /[0-9]+ foo/, "foo");                      # remove cpu ID
+	sub( /[0-9]+ write/, "write");                  # remove cpu ID
+	print;
+}' D.out > D.post
+if [ $? -ne 0 ]; then
+	echo ERROR: awk
+	exit 1
+fi
+
+# Report.
+
+if diff -q D.cmp D.post ; then
+	echo success
+	exit 0
+fi
+cat D.out
+echo ====
+diff D.cmp D.post
+echo ====
+
+exit 1
diff --git a/test/unittest/options/tst.flowindent.x86_64.r b/test/unittest/options/tst.flowindent.x86_64.r
deleted file mode 100644
index 53800726a..000000000
--- a/test/unittest/options/tst.flowindent.x86_64.r
+++ /dev/null
@@ -1,160 +0,0 @@
- => read                                  syscall: 40
-
-   -> __x64_sys_read                      fbt: 40
-
-   <- __x64_sys_read                      fbt: 41
-
- <= read                                  syscall: 41
-
- => read                                  syscall: 42
-
-   -> __x64_sys_read                      fbt: 42
-
-   <- __x64_sys_read                      fbt: 43
-
- <= read                                  syscall: 43
-
- => read                                  syscall: 44
-
-   -> __x64_sys_read                      fbt: 44
-
-   <- __x64_sys_read                      fbt: 45
-
- <= read                                  syscall: 45
-
- => read                                  syscall: 46
-
-   -> __x64_sys_read                      fbt: 46
-
-   <- __x64_sys_read                      fbt: 47
-
- <= read                                  syscall: 47
-
- => read                                  syscall: 48
-
-   -> __x64_sys_read                      fbt: 48
-
-   <- __x64_sys_read                      fbt: 49
-
- <= read                                  syscall: 49
-
- => read                                  syscall: 50
-
-   -> __x64_sys_read                      fbt: 50
-
-   <- __x64_sys_read                      fbt: 51
-
- <= read                                  syscall: 51
-
- => read                                  syscall: 52
-
-   -> __x64_sys_read                      fbt: 52
-
-   <- __x64_sys_read                      fbt: 53
-
- <= read                                  syscall: 53
-
- => read                                  syscall: 54
-
-   -> __x64_sys_read                      fbt: 54
-
-   <- __x64_sys_read                      fbt: 55
-
- <= read                                  syscall: 55
-
- => read                                  syscall: 56
-
-   -> __x64_sys_read                      fbt: 56
-
-   <- __x64_sys_read                      fbt: 57
-
- <= read                                  syscall: 57
-
- => read                                  syscall: 58
-
-   -> __x64_sys_read                      fbt: 58
-
-   <- __x64_sys_read                      fbt: 59
-
- <= read                                  syscall: 59
-
- => read                                  syscall: 60
-
-   -> __x64_sys_read                      fbt: 60
-
-   <- __x64_sys_read                      fbt: 61
-
- <= read                                  syscall: 61
-
- => read                                  syscall: 62
-
-   -> __x64_sys_read                      fbt: 62
-
-   <- __x64_sys_read                      fbt: 63
-
- <= read                                  syscall: 63
-
- => read                                  syscall: 64
-
-   -> __x64_sys_read                      fbt: 64
-
-   <- __x64_sys_read                      fbt: 65
-
- <= read                                  syscall: 65
-
- => read                                  syscall: 66
-
-   -> __x64_sys_read                      fbt: 66
-
-   <- __x64_sys_read                      fbt: 67
-
- <= read                                  syscall: 67
-
- => read                                  syscall: 68
-
-   -> __x64_sys_read                      fbt: 68
-
-   <- __x64_sys_read                      fbt: 69
-
- <= read                                  syscall: 69
-
- => read                                  syscall: 70
-
-   -> __x64_sys_read                      fbt: 70
-
-   <- __x64_sys_read                      fbt: 71
-
- <= read                                  syscall: 71
-
- => read                                  syscall: 72
-
-   -> __x64_sys_read                      fbt: 72
-
-   <- __x64_sys_read                      fbt: 73
-
- <= read                                  syscall: 73
-
- => read                                  syscall: 74
-
-   -> __x64_sys_read                      fbt: 74
-
-   <- __x64_sys_read                      fbt: 75
-
- <= read                                  syscall: 75
-
- => read                                  syscall: 76
-
-   -> __x64_sys_read                      fbt: 76
-
-   <- __x64_sys_read                      fbt: 77
-
- <= read                                  syscall: 77
-
- => read                                  syscall: 78
-
-   -> __x64_sys_read                      fbt: 78
-
-   <- __x64_sys_read                      fbt: 79
-
- <= read                                  syscall: 79
-
-- 
2.47.3

