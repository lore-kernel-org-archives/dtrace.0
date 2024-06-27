Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8941A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466788; cv=fail; b=I3lvtUP7vTFatDtP3karH/v3zNryvmRLcvSfVw0nwz+Jr8IfANWKytlVGWYPTAGKPoEBi3yGwtb26b1djmOLHrxEW+2ijWxwAWCyisZZXsgLUYOAJGhoLcu0Wwp3MdyuDUroLSnvN6bCbVpLZzGqPSeGEsw2p7LolUXKQ8hIbbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466788; c=relaxed/simple;
	bh=Bvi5EfKobfRJhz2526u1T25tld8Qpd1sKLEH4WfeOOk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nbeVGFxg7E0MisrasJhuszwQtKmjFG/omaiFHayWbrdEPHofnE/BfKbKvmg+g3pDbiZTdgE/nIKHDoVQuTqspzaPm0vjeYH7xeVgPjHJi7K/MUUCYXahHWEFTLKguPDCaZGDAEICo+EgFAavdeb57lkuVw6qrZSbIVmE0OPWd9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cU4Hucap; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=omg6bJhY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cU4Hucap";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="omg6bJhY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMW5t030890
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=nDf7ddDBvL/0pG
	z39qUT26B5Sdn1PmtyN4kQvDcYMAM=; b=cU4HucapQf0BmIq6wy/2DFFHBejFJi
	jp3LeQxnNZ6LnXsc74MbaUnHjmWIUOmXO/bu24deLz69dl+ge2ZHsQKKa6zcClCU
	cvuCodQamk1ecH227zsry2jy2ZPKKwcVcc1ExbuXiGg6Fipgm1x7ux5Jwa6peQ/H
	IHWK+Kp1F1VOZUjnpAPkwg267yNcL/dqDPXzOX6pQ3HOT6TcT6KglevhS0OiDXGC
	sShmVJqvBRk5jqV75MKM62xlmrQa759T+G3a912vtc8/NHc78M6vzHTzKg8X9ibm
	HuFx+ONaHARMkDJQghDNKKV3V2QVj3Hbf6g1JLFNBZ0Fo6et7R9MC0fA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5aPXx017891
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29vb90-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAggtwEelLnYzZua/osLkJkAlDp+ILe1hYsK4uoroz4Znl34VmQ5eCCbVjMnO2nyXoXPQMkro/X+0kAbKIBzeyByf6uvW9oNspWD/YQU+gEutFxkfSFkDk5d/lQwRF+nrheR+E4D9I+2GyHu5KhRvdLsXaG/d9UGydEZKeIw5R9RKthD3fs1+2vCoIfMI32TJufffTqzH916zmcEmvPJ8vXFCrjO0cu8CsVMkgLdgTg5yuA6+vICO9OVWD1WS3orheBsOGmqSk04jdZzbRV8ba5L3R41Kohjf1hNWddoyKcGi3FVnE7PorSgXblOYraTKfaZMy3XcR9ar/8cYkKfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDf7ddDBvL/0pGz39qUT26B5Sdn1PmtyN4kQvDcYMAM=;
 b=YbNoO9jrIuTsMxh1UZ205tuKVtIGdB86Mqe+Oz3DWZchZWNYo39O2dgDDAnfhVEJrYoJYEy4UX1QnLcO0mduy5TqYaI5z90+VQhQhLGPeaKFxAKfRc2BkF39lBtBr8kuU3ViEOZFQu9AGMmydn/BNcz0mlTppqQrHkUJ8DO1TMn4ty+FkhPRburOYjT1ikMFnMYDA4TlwtFeosyRwafsxY6ZcVoLUINlYGoikzTWaMoQZcN82x97gc4yvemeHEPZYhDDXl7Ql0hgLZuWr458I6DXYo6IOUNz39P3KyiBvsps69Izv6D/9tv0nWj3IRL8I348DyWbpdAUZRv6zD5T1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDf7ddDBvL/0pGz39qUT26B5Sdn1PmtyN4kQvDcYMAM=;
 b=omg6bJhYboRSR5F4FdiGcqBugv8VniG1Bd70RVXwvCy3CMJVMv1qnBfIeKuVvUUECB1bLxmKGkZEho1WIYdtGiqjX1nLq5dsHZZgx+0XFlby7wf7DIUY/GhQ76Ub+a0mEflHB3IupDpbs348iX/JFiMXsuzLYfSZQUvgNKPLYs0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 34/38] Create the BPF uprobes map
Date: Thu, 27 Jun 2024 01:39:00 -0400
Message-Id: <20240627053904.21996-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4e7006-6fc3-4966-d414-08dc966b8970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?COLyty1AZP6s0xztjbCtJ+Okm+J7r7Q6NB8ZVQchP0zpYrP7o2GpMQp7wIRU?=
 =?us-ascii?Q?fjse9s75zOhBayGs6QF0CrHWC+9H8Op8hmtTJCJzPAWF6mi5mQDq5KmxaJ+o?=
 =?us-ascii?Q?wkCtUY4v6/cOexi9yLoVOPt18ucFpMJBj1iJcaS7ciB54oZvbpHtgQmNep8q?=
 =?us-ascii?Q?cJY3GaHzHn5dOZOVvYHBXvog9LljZAmFjSYia5OP4+fVrfWlYlYrIO+LSAun?=
 =?us-ascii?Q?2Z8GZ3zQKT0kUiDOzGPyqwE8U7qGxfAJ8hb2kPO8/+f/p25yv/jGF9drSF8r?=
 =?us-ascii?Q?sic4Wrm1FCmM9wXvOOs3DbXfVPRMzTzK5cK1mw5O8HZXmpNQDIPmc5jj7cIS?=
 =?us-ascii?Q?Il5XXh14k3U3izSPBTXvpmazjmv9aYIpVVai/SIQsHZDX7t/oWlMburzm176?=
 =?us-ascii?Q?JvQ6Z+XizklBkCP3Dsp/FYttPWvjMma+SFzlewD23efB5ENAdkk5RYRhFACC?=
 =?us-ascii?Q?fmF7a5sXR22EDeE6t1BP4MsXkRf9vkWPM3kGdliSSEoKUDAsV+YlbDPFa4il?=
 =?us-ascii?Q?hFiCL0eUoTHFxoaYCnZukpfCMYXHceOpgdeHapT6GUCBSeet5fe3c0zUPEYt?=
 =?us-ascii?Q?cfqR39bkRRApndx+oTdZ5k3mLxg1XxMUE2csNgWpI1uLhNwWZd+idkpM4b7l?=
 =?us-ascii?Q?RrCi4NnBS4pt/5LHsgVMFNLRn7s+ysfnCV5IMy7bPRTbBZvHgXkTw8C9UpsX?=
 =?us-ascii?Q?i3FisBqXYgVsfYzl8c1SRGNKBZaW7ZbjNd5arE/tnvgbeAPoG6QnaOI9XYPE?=
 =?us-ascii?Q?l35Q5DoyjzVbABadsm69wcCBvKBbIBfaI58URszk5YmSLD1cGEvBfc9NrjtV?=
 =?us-ascii?Q?ARVyi4Ar5nH2BxkvE5MfuKoUkC/MOLx9bc3wsX4f163xOrCyzX4FfBFmhGFM?=
 =?us-ascii?Q?kTbG/7xa+loMJnPKcHw0ZwxiF5b4yHlyhb38Zy++vBwd1nvzcLcou1/yIQSH?=
 =?us-ascii?Q?bfTw1VsuEan2USziqC2dWdHAmCoOK/i4T7WLvtqWDPcUVumW3OscWB3IHfAJ?=
 =?us-ascii?Q?14Vgh88e4bRvIFfj0jkerd84dDyAqVaJdX5zZidHaZS/iL7p6DgmvTkwI5c0?=
 =?us-ascii?Q?GEmeQj06S3mup9MhYeVFROA3bTt82Mlv3b/70IRIdF1/ddK5RCWnqGcT6ihJ?=
 =?us-ascii?Q?+Fxlj7C97gqBqRGI3gtdnaTcxY+VM5XtScDIgM6wOMqm+g8E/8gGmLioVYQX?=
 =?us-ascii?Q?FJbYCmvxInKlFtI/FgWZwa04h1+v9DVEuxz8+UiFDSEcAIg0nkdEbcbaSNw6?=
 =?us-ascii?Q?zI8ESfClEoq7n/d+GBZ1wcpaF97FqNTzg9doIgPvkLYp+I2KH5rbM/ENZD6e?=
 =?us-ascii?Q?X1T4OWvwviseoWnm5MpITIwNsWOIE+d6/TZe1VtEbGe/jg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rT4E+kdGMhFcEzXQFSR0iizIUMWVsfYC32K4/F8K+wcNkH2f95J8rGC485gy?=
 =?us-ascii?Q?07ZaeaAHlIiF+UmlzFJdOKSdu9MnYz5efy+BKoJQe4ytVFYAYU5MymhrvYMi?=
 =?us-ascii?Q?es1jYQyjkVamtkHAnh1xvn0nZfIQSW9a/UQtlDFMuQTzlnVOByiAeInYwCjv?=
 =?us-ascii?Q?NuwR/9jlTylEQr6EClUm93G+LgoSRv/D+9lQ2Gx0n8WiQ4r3iOG/+kCsc8d7?=
 =?us-ascii?Q?OHdHjjkEgNMAnzz6/A+u9jrA/p0FtrR33FaRnnDFYPZshA+EC9rq9AAa3pGX?=
 =?us-ascii?Q?qn9MMNYKdWxC51SMQGH5cmrPVqy9xbfTMq9SUGZgH6AIPwcTESwsj+pDe+xl?=
 =?us-ascii?Q?C46SJj7n746DCysLWzkOP29cfSFfe6SExg6I1gsPhPRJ+9rxKFln4hVv+FKx?=
 =?us-ascii?Q?/a0u1WaBeyParYoNof04pLfkRxfr6dhUMJpXDjEHejJ0Jg7edEBEnJUH4DDO?=
 =?us-ascii?Q?iPcvvqcAjjPEqK128kqtD+tJ5oJ6g5JLLYkrwTX6EAcION4VWRZCZpMhSsiJ?=
 =?us-ascii?Q?lbw/mLq15d7ai+nzmLyrmJ3EosN+rbCcDRiknE1JPlt4UYTQsmXXKvfqC+9b?=
 =?us-ascii?Q?rpymZiR/TfrQw+g0ilSGulK/wvxvVb6egIwm6qWlqvCaWZvA9jPHYAYRBUrt?=
 =?us-ascii?Q?pCLKvc89YgAuOA45NC1v/ukdy7CNapXFYCDHDKERrXV0nrYuRz71D/yHTX/K?=
 =?us-ascii?Q?yuq2qwthd+6mt3N1MT5mV5KKpOs6iZEirGPG9RzE7n8W34PPcCaI3atI9ld2?=
 =?us-ascii?Q?QrXat/mXRnNeNvCE1CPZVZtFocy3Y31eylHdaAaMQnB5gmJQzz7XLTk8czP2?=
 =?us-ascii?Q?BXn6xxKcBdnRvSsuIxbba4HBggcx7EgwxqRclTNfOVQA0qv7rr5qFIDIVvBp?=
 =?us-ascii?Q?6RXCJG3Q+fhSKk9Q4Vd/D1r7YPq7EQ6ZTAoCEio/J5BZqrICeS29XOM+WFEb?=
 =?us-ascii?Q?VCQzWsyKLPayVysHy3XXe33jKfttTcYv/TqLQpkvKn7Z7GdQdUvwOa6IODn0?=
 =?us-ascii?Q?1QXuKSHZw2HnzFrqa0EgHH1oe2L+NCPhc8CrjprmPlbIxXxcfMMIWVQiEX8H?=
 =?us-ascii?Q?ZUOn5nN41CMLPfWiN7W80lxQkZxrYieZv/bPAXoaUKYu0cW2z8MQ2sr5y0GE?=
 =?us-ascii?Q?BP4RZYBBJPSOtl/ITAeBLHDhubCv6JtmidEmHEGV0qddxDdmJKrgdcX35dxp?=
 =?us-ascii?Q?fIftzQ/o3nDUJAH0fY105Z4HwDV6OHME5If+QE5pKHtvETNkMIHJOuCFiU+X?=
 =?us-ascii?Q?xX/zStgJHhSUZGd5ge2BwvHMVbyQNq4teUbQ4LA1yMxo8VmFHttg+JunbQqP?=
 =?us-ascii?Q?IEIil0gLbo89/joMkwDbT5giuDOfOKgYCfk3RMfBVBA23DVkmg1R/ykZQd28?=
 =?us-ascii?Q?sV1hB46bOydgFP6fNdjJyGP/odx4ydXEksDLG4ENGyU2m5nqu6UpNJfL31z3?=
 =?us-ascii?Q?ccTn7jlXNPPbgSxbnGL4VlPRncQh5Apt89Lg+LUc7jV8A867D5JvJrCmeKR+?=
 =?us-ascii?Q?vrCDJsk0QuHo5y2uIFZsikr2CeZyEtqchwJ21aGj4GP0il6nyHLluZuZc+6f?=
 =?us-ascii?Q?wKfP2bvc0HWjj1Po7YqX+OnsehqgoaFkTfqo5c9i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2R2DoFgaUEmc72UDa/f3py1JExRd1/LSa9orOYwGY9cIh7ofzLw8LEkr9vEjolSX+YoClJskZxmESkZUY86CxTgNwyX7zVwOSrm+FWtaQQsAyWz+Uac3sa5bvUJx8KJ0p/9J+esDwoPRG3X4qe7yMb8vXFgTR+kBvjsEB0LG6nC5wjsBLB1MB5JqZ2SGE1yWvI7xro4uITMk3cOmkT5PbZvjuh6aK/YgmTMouYHgm9Fr8jQ8Ro2IZIOGyImW3U8VeaHAhBh7gmvxOE1wFv61liXeH1BVtaoVNwf9vMSzcxaNHqGy3ECG5YE7DXmslOqa4INbVuokAqcPD2prKgzk6lzuFNoAvQOICYeIECHOo3CODppp4W+VTZg3w1oTXLD3wTE1TC93KyKyeRs+lgWPbTrnBGlU5VDlZ48b7GGlu4KfJ4LiGsOgHYDjgqYFP83jDnslvWhwLxQmgRq4iQrWVjAO0/QIKfuYWUdfb/qah8PLZKvW3C16jpBb3Es+FYZrdn3jplgP24d45Ljpt05d/jg/VnM8Jc/YL7Ix6l1KQO+LaW15Xl9O/uAZXQzISy+lrhd8pF8UDLvjm5HSLwSIAQh+z/5l2+Sk8OjtuaZQZGQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4e7006-6fc3-4966-d414-08dc966b8970
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:39.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eOLBDW1J0fy72B9cvF8CEWPTG2xVcucAVFsnC5o5d3k5fO2XF6dSKJ6KAamBrbjBhe0qTxiO0Nq63lNABCqHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: Rfjv5yA2Bf5MzKjXxxbqJriHEa9Va5Xb
X-Proofpoint-ORIG-GUID: Rfjv5yA2Bf5MzKjXxxbqJriHEa9Va5Xb

From: Eugene Loh <eugene.loh@oracle.com>

WIP, sizing is hardwired for now.
WIP, should add new pids and purge old ones (after the initial call).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         | 44 +++++++++++++++++++++++++++
 libdtrace/dt_dlibs.c       |  1 +
 libdtrace/dt_impl.h        |  3 ++
 libdtrace/dt_prov_uprobe.c | 61 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 428cb407..908c2823 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -944,6 +944,49 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Create the 'uprobes' BPF map.
+ *
+ * Uprobe information map.  This is a global hash map for use
+ * with USDT and pid probes).  It is indexed by (pid, probe ID),
+ * using the probe ID of the underlying probe.  The value is a
+ * probe ID for the overlying probe and a bit mask indicating
+ * which clauses to execute for this pid.
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
+ * WIP.  Note that two different overlying probes (differing by more
+ * than just pid) could map to the same underlying probe.  E.g., a
+ * USDT probe would have an underlying probe and pid probe with the
+ * right offset could map to the same uprobe.  This means that clauses
+ * called by the uprobe might have to be called more than once;  one
+ * would need to go through the clauses once for one overlying probe
+ * and then again for the other.  This scenario is not yet addressed.
+ * It is a problem even before this patch, but easier to fix.
+ */
+static int
+gmap_create_uprobes(dtrace_hdl_t *dtp)
+{
+	dtp->dt_uprobesmap_fd = create_gmap(dtp, "uprobes", BPF_MAP_TYPE_HASH,
+			 dtp->dt_uprobesmap_ksz, dtp->dt_uprobesmap_vsz, 1000);
+	if (dtp->dt_uprobesmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	dt_uprobe.update(dtp, NULL);
+
+	return 0;
+}
+
 /*
  * Create the 'gvars' BPF map.
  *
@@ -1049,6 +1092,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(uprobes)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 1fb561ad..357396c8 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(uprobes, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index f8799b86..1368d484 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -423,6 +423,9 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_uprobesmap_fd;	/* file descriptor for the 'uprobes' BPF map */
+	int dt_uprobesmap_ksz;	/* 'uprobes' BPF map key size */
+	int dt_uprobesmap_vsz;	/* 'uprobes' BPF map value size */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 5f0c56db..e99f02c3 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -45,6 +45,7 @@
 #include "dt_probe.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -69,6 +70,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct uprobe_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} uprobe_map_key_t;
+typedef struct uprobe_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} uprobe_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -83,6 +93,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_uprobesmap_ksz = sizeof(uprobe_map_key_t);
+	dtp->dt_uprobesmap_vsz = sizeof(uprobe_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -162,6 +175,53 @@ static int probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
 	return 0;
 }
 
+/*
+ * Update the uprobe provider.
+ */
+static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
+	     prp = dt_list_next(prp)) {
+		pid_t			pid;
+		const list_probe_t	*pup;
+
+		/* Make sure it is an overlying pid or USDT probe. */
+		if (prp->prov->impl != &dt_pid && prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			dt_probe_clause_t       *pcp;
+			long long		mask = 0, bit = 1;
+			uprobe_map_key_t	key;
+			uprobe_map_val_t	val;
+
+			for (pcp = dt_list_next(&uprp->clauses); pcp; pcp = dt_list_next(pcp)) {
+				int n = atoi(pcp->clause->di_name + strlen("dt_clause_"));
+
+				if (gmatch(prp->desc->prv, dtp->dt_retained[n]->prv))
+					mask |= bit;
+
+				bit <<= 1;
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			// FIXME Check return value, but how should errors be handled?
+			dt_bpf_map_update(dtp->dt_uprobesmap_fd, &key, &val);
+		}
+	}
+}
+
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
  * uprobe.  Since multiple pid and USDT probes may all map onto the same
@@ -820,6 +880,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
-- 
2.18.4

