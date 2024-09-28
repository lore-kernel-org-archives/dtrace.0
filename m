Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A714277
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727489740; cv=fail; b=inQh9izjGm1pOG120p2hLeaqKUyddeFcy6zNxGjA3JBqLg2sicsV06Nm2LpBY3Ug1J8bue6cENgj3g6bxRq4i4ftZymmtVxIZjFL1Yt7ZdcRanq/zwxErgNcpQRKNV3XlULNZn9h4Xy0ZSgYNUOO9tCLJRRo5cIp7gi1dvG6vG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727489740; c=relaxed/simple;
	bh=hLz393bfCrDs4g46we59tj584s05qXlSSfoqVFXZq8k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l1Pmli1ljcnFwsDUmtCaKEOudkEqwCU+WJAg5/GXMOFPHvBoZl5+lhGElqS57QjZUO892zSeFBcBRzI7xhKmuN7De1wEVMi7+axM0am6uxh5n3P2DW4flmX2D+zfu2Gdh2YRoaOhJo6T6pEoBZVMbHVFck/bqn+/Jx9TxdT8+i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nSbuvhVg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jzpXgbCR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nSbuvhVg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jzpXgbCR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1YMXC023128
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=LqvJdnSbCYA3Go
	rwHAcuaksRNeDWhN7CcHLuRCkEP4I=; b=nSbuvhVgvH3MlI94a8bUSGOruWSkwy
	lasvNdyAEcf549JoqOeCIMgKCmYUbYUxPsNoIVqyqgbDq57halTr+i5IT9UsBkeA
	euAotYrqPPF7LyiFOFZC7pBa704issppYcvhRt/6o2nGktSSescCVqF6D6uHel7V
	vO/uF02a5k5lr91hqmRpMtOl8fbNGjd8XcYi+zlRfcHCN7DgLsfr3KrTDUWB/ajM
	AxP2YZutT8q/Jqm2JYj36/JMO+MQmvgnSuaQJdnaE1vx2D4uX8ThcPP4RBliN2u6
	WTrgcD0apnR8cAAf8aDHcxFkrsHWfcNmHh1l5ZQmP+E1XH7ptEsPXgdA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sppugyfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XFDB040580
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848m1f-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW3Oql48QjRGil5uP+soYNfivpSIueWK7qS0X0kCksw8zH6smnz+5fPpopogznP+DINtg7GPQng6YswbQuINYmfyblxTNN9cKdr9T36LPOBmqQiI1bosoiMbujjkL22tStv/syTdA/hDfYxvQjpaBT3n2SPNY0IlikvOasu192pIOycGNSpB3tHc90VJT7tmRvY28i/gBM3KlSevG9YKWZQ/31X3q2zH3sWepe6BsEYnTddxNjF5t9ezSyMXL7AP2dvRqz4NJdnzUbfloZRxdkkYHGgkzCsjTSi4/yhypTBg0CggfK+bk1IRh0KFgXgUt7zDAeEdjgftL4P0g4XfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqvJdnSbCYA3GorwHAcuaksRNeDWhN7CcHLuRCkEP4I=;
 b=Ev54ihw4EMbc3ltuZ0WsKwPNf3BTfnRBqSb7OXUfvI03VO75GnklBtSBhKwdjx21NlHXKSeJHLimFALsl8hw/dBl9werbdeAzqzRrX8c9hkHMjnzjcIpwDk4/Wn/zV5659iNn2trbhnbBkvwDArbie9w8QnXIt7WDGGw6EeECmz4uDKYhv2TFsTw+iIGOnGMlVx+cE8LT/U4KoJ2cvixhWqIGwzwPQJgkGcjVxGwcOWLv95EXcQv8Ohw0PPZhUHXdaMfW/Ipe5hbwYoYQREQP0vgizMFCqlBv54SS2q1eKy7usy87pmeDVSn9nTw6NHl4MXG9UTSvB7o4fb+XHuD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqvJdnSbCYA3GorwHAcuaksRNeDWhN7CcHLuRCkEP4I=;
 b=jzpXgbCRcnA93/qiSXrPjfr3g3SPLPo//FX0fwXHY7V56k8U8tG5ALwIRf+auAVzaWpJ+9Enw2XDDvm2OInc0c0IB0aRSpuM41RgndvLIUSCkOdiLyzsxuo2621JqJkYSYRG6a3eWqaZ+/oY4MhqsIRg4qLZlL8I1liVY7bTUs4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:15:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:15:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 07/19] Create the BPF usdt_prids map
Date: Fri, 27 Sep 2024 22:15:25 -0400
Message-Id: <20240928021525.8987-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928021525.8987-1-eugene.loh@oracle.com>
References: <20240928021525.8987-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 223f55dd-4bd0-47e5-2f1a-08dcdf636c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?InMT64QXX0UZwsDrl3TbW0v+R+EJX3TcMjaOb3SXQ1upc+N1FNVqOAm/IBC3?=
 =?us-ascii?Q?fqut/7dbrDcXQWYCuk8LbHCvzwEPvLK3iLduf7L/aqUOCWcnT1IadsuTQJsC?=
 =?us-ascii?Q?fkGus0g6e+LvnrRSMqbvrmjKdfB5R85JaU2Qqex7wbbTLnuEF+V4AglTIDbf?=
 =?us-ascii?Q?G/lkw9xR7bTLcukHNCQRW+X04gMmn/2EveAqq1cg8VTfOtLcmWNuNg6Hd2iP?=
 =?us-ascii?Q?vuH26wr2h6SOsyrdq6Z0thZBvWLy4V7bU62TaINxQqXY9qI4vEIEA3zzFdY/?=
 =?us-ascii?Q?bzY0wdvSclZvOphkgEEal4sZBpestNF4J9jJwwYjKdr+k1/iuPOcafF4pIdU?=
 =?us-ascii?Q?j3oC5wlfXKpECYrxUlHjMaaqUnrEuDWvAd3ubdjokpJ6XuMHeFHrqcCIZJXB?=
 =?us-ascii?Q?qweWmmWqHGwJDEZg3wfBG+9QkEQFs+6A4WmFJEeJ0Jd2J2WqkQ6MoPSL//In?=
 =?us-ascii?Q?Mi5GsL0e6P2u/KfSTd5dpp8SIQ34tuwgBwDbA3VMI/TayLfnx9eCX2KLSUqV?=
 =?us-ascii?Q?2ZT/F7z1xdk7eWYttv0pnz0IntIhgIF53lR09P5cXFPlcH5IzG8Pyi6TKP32?=
 =?us-ascii?Q?IP99E3RP1eva9DTimeTgEUtXtIExayBsHMww3XEBEUThmzI6/MZkMdihcbVc?=
 =?us-ascii?Q?zZ4Hy1VcWkKId4h8An/fr9wpXPnv9rRGsFzZc4wS8DSOHaxw1yvsGAd/ezHL?=
 =?us-ascii?Q?6pu3GuhNgZ1yz/iSq7FZOf9GNX3o45W+mNmIhirTls/PkWUxVHVcYQSYKzlG?=
 =?us-ascii?Q?qmDFf7XDqE/EHJcYTVDJACEfxeM7nSNNT9JpZT6jw1cy8uOzoj60fvJCl2DN?=
 =?us-ascii?Q?lufvrut8gA+1gPGel4wiFAELWwLkOHX6dUTYTCr67sEFL/pc9HNWMmwtRz+L?=
 =?us-ascii?Q?u/S62Oub4valfPqw2leBW2FIS2EOOLGxrvh4IQX7jvb5nxocfziyEkkqv6zb?=
 =?us-ascii?Q?Dybip0cOVlylC6pgiOe+mpk/rqdi7JjFPkFO3ZEJw9dEXtx/cRNqtSe6HLtU?=
 =?us-ascii?Q?Tzf6nnaBwF3xKVt6aTdu52eCtGZayaZdV4R5frmNtSUfI//Wq2cCou1DY7vi?=
 =?us-ascii?Q?V9Bk+xnqglRUHZjEf5Rp7Pk3oBFxEd18I0mhXUZDD/IMbBoINzSogZcOE2h+?=
 =?us-ascii?Q?GYpsUaRmUYOPv384IJxiQQU+51mmyc1PolHyISpgCAQ4oKR3wYbQpXR2OtzL?=
 =?us-ascii?Q?KJwS8/MOcJkMUoCVkQai67u+zLNfqio8g8hHE2gyf6Jxxm8LLGC4lsCKxoa7?=
 =?us-ascii?Q?YubWoJHVOzwAL45ode9+1d5A7eGsXU2ai+8FbvZEZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IbfTGtLDgU6a72KNxxYD9m1aNcS7+FBlqd41EWJUcyLX9iL+0FT5lhpmAgVZ?=
 =?us-ascii?Q?7n8QoSzng31s/IOOB0TRY1Bm8cRpoyqnPwHZkQqDApNT5AouCEuZHO/mWb9T?=
 =?us-ascii?Q?F2kd+N2UAm7KvqhshdnQPbSrP7s+f79lVeZyBEjax3mVtxjuf6A1L9/RrpgE?=
 =?us-ascii?Q?txj2JOtNw3BmCe2toWXAhNdTnS8mHRi3iOXT5cJMtZ+trju/lGj8wwf8r4kq?=
 =?us-ascii?Q?Vw7x5xXdsIbaqBq+6984ont8eUA4u74H9n2g7nDWkbqvJL7QYtxan3/XxyhL?=
 =?us-ascii?Q?nRsqT59HFr/ev6MHPYB/DapnR7BneTrw63opYPGslukab6EPYWLV6UgDOETN?=
 =?us-ascii?Q?ShP28hyRSJ0cUT83n0GnN8OjGu63mWVP4ukkQFx46WvzzipZoU01IetdmCY3?=
 =?us-ascii?Q?S478D+MxbHC4ifthk2PFj/FnUT3+i+vLN1H+Dyf5qcvOJuncZrbgkHRPcfJN?=
 =?us-ascii?Q?RK13EJGESgs6fP2/tVWg2Ii8F6GL/OwwWDZAW4tG6C2304Ms+J06Qcfalkg2?=
 =?us-ascii?Q?e/qGpNNRVE6rHVa6limu+mQTwm6Z6ZIJxzZkdPJpg3QZFNPh6g2ueRqrUNSH?=
 =?us-ascii?Q?8GvYUjWhNkx/TFk/fYrB36orpv0Kwdu62m7clxmYUiST2Cbad4NxE9pT9bRT?=
 =?us-ascii?Q?GKDiwEadi1NcNmqgDo7PjyDTDHvll3DpubpPB3frJsUIFKYwCTyzM76tYywI?=
 =?us-ascii?Q?qIjda3JSPyifIgNrpmP3ZbeL/tFIjgz8Ywnp6yN/FoNJJayqYkWRojuZ/nBN?=
 =?us-ascii?Q?UAnvF26WJ3O6mGB3+0Fu0vHYY2bcTSFEXoxSiwMKSnTxUYmStlUTkTbQ1+qL?=
 =?us-ascii?Q?N918UiSWRlgbeOcWze7YgjiYgsQcqNxsC63fTawvCo3K3fhxYGyi83qPVplN?=
 =?us-ascii?Q?rnSpeWKlGge4AFTDvMy9LVqNAKUBdTjPZ1t/J2fJYPSN8LGsljTr30ACP+vP?=
 =?us-ascii?Q?VVcR5Z9+yMky5ITiuNwLXckeB1zQstd8AXv7DKa8+gnIAAO+8UNMeLPLFSk0?=
 =?us-ascii?Q?FEyAfSWgJcfGTA5cyBEfbdwSgtfTaGqBpHsq33xAYkb5n6ksadMMFOqumIle?=
 =?us-ascii?Q?mx/C4GlWc/dpS3CF5/xaUZ4XK8n01PS1UPjmpXOKHOZ0wNQuFaLwCEZYiqao?=
 =?us-ascii?Q?F8m1TZa/YvqZB2q4BLkPo8w74tAOP7fp/N9yEqDBaRf9+YYlsVN0MroHhrKb?=
 =?us-ascii?Q?NjyZzxyOxz48s9eiJrS31ixA2gNfYlxc91n3cX2qgevz+gHqhMJdkPjTpN0e?=
 =?us-ascii?Q?c7EyHKKoQiNWr1a1ziNDdwYC9eUm7HA85SPiAwiXBV5ezrMCj1C6XhTZsJWg?=
 =?us-ascii?Q?JIQ0zDDPEcveOPC/MIWT1vg5OOHOITv72DHmqaOWTcgstnwyrtMjQwcbqenb?=
 =?us-ascii?Q?Q1ua+QA0tmzrnPXlYBPXPAshV21OTEgCjeQyweayTIACWhJWqiVdX3dapynI?=
 =?us-ascii?Q?BtSt2WNYtPjy49FY9JKDvbFGHgmSy3um+ScaknLTyS0/pkPR2ayMdyytE1Or?=
 =?us-ascii?Q?xE/RbEoNJTfY9XCDV4/C276lz53O6SEBQUBVr+PDcC8A7sK0IByqELG4ff4L?=
 =?us-ascii?Q?ACjwztA8/FtA169lXXm7Larf4Arr/3oAbR9Xw32L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G2eAtuFYbdK0BZ3FPOIZEP0mt/Dbxz6t8SfVt/xtOOTtIiHsfSZ7gByoKnji5vh4K/ED2d1XfrS0QEA737e8IXdXQA1XQElh4cu6YrweZuMJXqbBNRMSqnRhZ1LdMONV58QC738Aj+SOFRWLV6ghOqrylrqaKo0LqJ4psWyp8Kg6kUl1UKuy6i7+VEQEOqPvugUHbou75ZXKe5AhrsUWEfc2A1xZOpgeyadvUZBo4/qXEX93lFAXX4BIcUjgPq8PenxhDN78093PmsnN168ePBcVyh3o2w3lev9S8D8o9VnE9oPKF+4vgGjWQWB2aygXZN+ob0dNcgAHU56/MkFoVMOFoPAwEhW0AsCUgfeCJcGfc/vbvunEhinEprebEPp+RkmnKbJLklZUUKWki1lrRP0Rn+uZ9hssyZg5b6+Rpav5nXzz+CIVu0RUqX/65CqKSqmXHFZrjjqK7efw2xuCWk53uzxVgH8n95GqkUEkF1Q+8I8MDsRo0YMpVx4shamYnD728ej2m6hPTs60EhPmLSHjMTTbJoOD/N+utfO/akBUQb5iEPvnHtd0lB1Sb8YtjdPtvipmXOLH1JH6aOg9dLDaZ36wGUDhSNQqHPkRi4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223f55dd-4bd0-47e5-2f1a-08dcdf636c2b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:15:29.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JSFEmcXlzkuTIsZAT5GeidsDc0fGcblWJLROmXBsRzYms2DLVuXV7gNrtWcT+tBLNf1TkpjRKoDIBvafdNvaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409280015
X-Proofpoint-GUID: xQc9oKXSmlNLJasIFf_0m6kAdzKU3Ejs
X-Proofpoint-ORIG-GUID: xQc9oKXSmlNLJasIFf_0m6kAdzKU3Ejs

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the overlying probes for an underlying
probe will change.  Hence, we will move to a scheme in which an
underlying probe will walk all possible clauses it could call,
deciding at run time (using a bit mask for the overlying USDT probe)
which of the clauses to call.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As processes start up, we also add new overlying USDT probes,
requiring updates of the BPF "probes" and "strtab" maps and of
the list of enablings.

The underlying-probes "update" function is called sporadically.
The focus of this patch is the function.  When it is called can
be tuned in future patches.

This patch guesses certain sizes very crudely.  These sizes should
be handled more robustly in future patches:

  *)  The allocated size of the string table.  For example,
      new provider names have to be added as new processes
      start.

  *)  The number of entries in the BPF "usdt_prids" map.
      There is a little relief here in that, as processes
      terminate, they can be removed from the map.

  *)  The size of the bit mask -- that is, the greatest
      number of clauses an underlying probe might call.
      This is relatively easy to extend;  nevertheless,
      that work is left for a future patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         |  43 +++++-
 libdtrace/dt_cc.c          |   2 +-
 libdtrace/dt_dlibs.c       |   1 +
 libdtrace/dt_impl.h        |   6 +
 libdtrace/dt_prov_uprobe.c | 278 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_work.c        |   3 +
 6 files changed, 331 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..4acf6e494 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	int		fd, rc, err;
 
 	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
-	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
+	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
+	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
 	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
 	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
 	dtp->dt_zerosize = 0;
@@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	if (rc == -1)
 		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
 				    strerror(err));
+	dtp->dt_strtabmap_fd = fd;
 
 	return 0;
 }
@@ -936,6 +938,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 				dtp, "cannot update BPF map 'probes': %s\n",
 				strerror(errno));
 	}
+	dtp->dt_probesmap_fd = fd;
+
+	return 0;
+}
+
+/*
+ * Create the 'usdt_prids' BPF map.
+ *
+ * USDT-PRID information map.  This is a global hash map for use
+ * with USDT probes.  It is indexed by (pid, underlying probe ID).
+ * The value is a probe ID for the overlying USDT probe and a bit
+ * mask indicating which clauses to execute for this pid.
+ *
+ * WIP.  Just make up some sizes for now.
+ *
+ *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
+ *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
+ *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
+ *     So either uint32_t or dtrace_id_t is fine.
+ *
+ *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
+ *
+ *     How many entries should we allow?  Start with 1000.
+ *
+ * Note that for a given (pid, PRID) key, there can be at most one
+ * overlying USDT probe.
+ */
+static int
+gmap_create_usdt_prids(dtrace_hdl_t *dtp)
+{
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	if (dt_uprobe.update(dtp, NULL) < 0)
+		return -1;
 
 	return 0;
 }
@@ -1045,6 +1085,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt_prids)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4202771a9..12104fc21 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1045,7 +1045,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = 0;	/* FIXME */
 				continue;
 			case DT_CONST_STBSZ:
-				nrp->dofr_data = dtp->dt_strlen;
+				nrp->dofr_data = dtp->dt_strmax;
 				continue;
 			case DT_CONST_STRSZ:
 				nrp->dofr_data =
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index ba4d4abef..924cf11e4 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960..1d1248766 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -282,6 +282,7 @@ struct dtrace_hdl {
 	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
 	dt_rodata_t *dt_rodata;	/* global read-only data */
 	uint_t dt_strlen;	/* global string table (runtime) size */
+	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
 	uint_t dt_rooffset;	/* read-only data offset */
 	uint_t dt_rosize;	/* read-only data size */
 	uint_t dt_zerooffset;	/* zero region, offset */
@@ -389,6 +390,11 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
+	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
+	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bb172ace2..d99915fa2 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,8 +37,10 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +65,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct usdt_prids_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} usdt_prids_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
+	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -123,6 +137,269 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Clean up the BPF "usdt_prids" map.
+ */
+static int
+purge_BPFmap(dtrace_hdl_t *dtp)
+{
+	int			fd = dtp->dt_usdt_pridsmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+
+	/* Initialize key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over all entries. */
+	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	return 0;
+}
+
+/*
+ * Grow the string table map.  It includes the string table (which might
+ * grow due to new USDT probes).  It also includes the read-only data and
+ * the block of zeros, but these remain fixed.
+ *
+ * FIXME Is there a danger of the BPF map update colliding with map reads?
+ */
+static int
+grow_strtab(dtrace_hdl_t *dtp)
+{
+	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
+	char		*strtab;
+	uint8_t		*buf, *end;
+	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
+	uint32_t	key = 0;
+	int		rc, err;
+
+	strtab = dt_zalloc(dtp, sz);
+#if 0
+	// FIXME do something
+	if (strtab == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+#endif
+
+	/* Copy the string table data. */
+	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
+
+	/* Loop over the string table and truncate strings that are too long. */
+	buf = (uint8_t *)strtab;
+	end = buf + dtp->dt_strlen;
+	while (buf < end) {
+		uint_t	len = strlen((char *)buf);
+
+		if (len > strsize)
+			buf[strsize] = '\0';
+
+		buf += len + 1;
+	}
+
+	/* Copy the read-only data. */
+	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
+
+	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
+	err = errno;
+	dt_free(dtp, strtab);
+
+	// FIXME do something
+	if (rc == -1) {
+		strerror(err);
+		return -1;
+		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
+	}
+
+	return 0;
+}
+
+/*
+ * Update the uprobe provider.
+ */
+static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+	dt_probe_t	*prp_next;
+	int		i, prid = dtp->dt_probe_id;
+	uint_t		old_strlen = dtp->dt_strlen;
+	dt_pcb_t	pcb;
+
+	/* Clear stale pids. */
+	purge_BPFmap(dtp);
+
+	/* Update dt_probes[] and dt_enablings. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		assert(stp != NULL);
+		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+	}
+
+	while (prid < dtp->dt_probe_id) {
+		dt_bpf_probe_t pinfo;
+		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
+		int fd = dtp->dt_probesmap_fd;
+
+		dt_probe_enable(dtp, dtp->dt_probes[prid]);
+
+		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
+		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
+		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
+		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
+
+		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
+			assert(0);   // FIXME do something here
+
+		prid++;
+	}
+
+	/* Grow the strtab if it has gotten bigger. */
+	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
+
+	if (dtp->dt_strlen > dtp->dt_strmax)
+		assert(0);               // FIXME handle this more gracefully
+	if (dtp->dt_strlen > old_strlen)
+		grow_strtab(dtp);
+
+	/* Review enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+		list_probe_t	*pup;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (!Pexists(pid)) {
+			/* Remove from enablings. */
+			dt_list_delete(&dtp->dt_enablings, prp);
+
+			/* Make it evident from the probe that it is not in enablings. */
+			((dt_list_t *)prp)->dl_prev = NULL;
+			((dt_list_t *)prp)->dl_next = NULL;
+
+			/* Free up its list of underlying probes. */
+			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+				dt_list_delete(prp->prv_data, pup);
+				dt_free(dtp, pup);
+			}
+			dt_free(dtp, prp->prv_data);
+			prp->prv_data = NULL;
+
+			/* Free up BPF "probes" map entry. */
+			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
+
+			continue;
+		}
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			long long		mask = 0, bit = 1;
+			usdt_prids_map_key_t	key;
+			usdt_prids_map_val_t	val, oval;
+			dt_uprobe_t		*upp = uprp->prv_data;
+
+			/*
+			 * For is-enabled probes, the bit mask does not matter.
+			 * It is possible that we have this underlying probe due to
+			 * an overlying pid-offset probe and that we will not know
+			 * until later, when some new pid is created, that we also
+			 * have an overlying USDT is-enabled probe, but missing this
+			 * optimization opportunity is okay.
+			 */
+			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+				int n;
+
+				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+					dtrace_stmtdesc_t *stp;
+
+					stp = dtp->dt_stmts[n];
+					assert(stp != NULL);
+
+					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
+					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
+					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
+					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
+						mask |= bit;
+
+					bit <<= 1;
+				}
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			/* linux/bpf.h says error is -1, but it could be -2 */
+			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
+				/*
+				 * Set the map entry.
+				 */
+				// FIXME Check return value, but how should errors be handled?
+				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+			} else if (val.prid != oval.prid || val.mask != oval.mask) {
+				/*
+				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
+				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 */
+			} else {
+				/*
+				 * Nothing to do, it already is in the map.
+				 */
+			}
+		}
+	}
+
+	return 0;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1059,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 40913a0f1..0efad3633 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -368,6 +368,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+	if (dt_uprobe.update(dtp, NULL) < 0)
+		return DTRACE_WORKSTATUS_ERROR;
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

