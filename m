Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C21EBA09
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832837; cv=fail; b=OeHW45+38/jbXarL0tWXFJ4lJEz4CRXD4wgMPI468Pueel8kEN/V5iVZi9+9fIZghfzinrhvJyTPVQOFLfq92KWU8yQT4bwY1ZzN2gwMBTkG/QKw7yW83/V02R4RCcT9V4r4fdCI9ZJEOOuiEvYtP5CXZVVv5kAwZ9poc7L4yiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832837; c=relaxed/simple;
	bh=vEE/h0QFbPeho4pcRAnQLLJDh0TdE5lGjKtTDkaIxl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gJiPJP4/OMQ5KO2mCeg7AqKmbBOZ1gGYW1cylRkRpXW3l/AzJAbfpXSqc70GTf5RtAbLilXiH9gVBYCB5Dd/g22jkykBwxxrQt//50oWCrV7eOho2FbGcm95754OWLf7zBsAgs/kXZ997L4Ye3K2D0ZtU05BV8cvwz5rmFja/ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UIkSsRax; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=caAS+u2e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UIkSsRax";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="caAS+u2e"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DiYiQ009194
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 18:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ankVlM27RrcnL40DrN
	3o5WOeBoOUr801Vo9NiFptvlo=; b=UIkSsRaxx/xuAH4hKMB23UrFNVb2wVI8q1
	F/o+On2A/uu1wjoSi4AkrltapNrNDskKGtP3O+on22t+UDiRTN/QMXHjA06YEguf
	ovB1R5cD8jYm246zVM+Bhq9FP0Wm5040uVouTMAUdzkSdNwc+DE88hABz4nyZ95Q
	0dOJ0JkM2bvG/2TBngPjjbTuHbB4O42gW/JbIcymMh91KQGexIbU93gtHWUCgnEF
	HgH8CfwTmYPBDen8OJtIsgdEVmtowxJS/ebuGpIUTiav/YjGlwZY2652lV/1LXpK
	aPrsW/WS55q6D46VaLIrJIQkNfVNE3QihorrS0JDrnwDq+bq8A4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ncmt64dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 18:53:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5IV6CM009833
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 18:53:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdu8j0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 18:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta8qXtBqJdpKZRodkYDxGoiN6MARsHpOlSfu/2G/phcnyjbN+41J2Zld9nhP1JcHN+jFMp2mKQot0E9DMj+Osv1QweYafW2HL1+Nj/GQVoviPA2ys7eNSeEAOXlQNuwp3kU/BEa6hIJYkTFnZjhyWQH91AFFTnfuSLlqHIjG+YMPmyUiJbppHwvjzvdevX7ViQoArWQK8RgUsGinUE752yG/vx+daEgtqQkvbByZwRVOEuAz3V0tcqwNn2Hx2XeK5SUur8dfsbn1q9GrhPiaY8yy23r6LedpYcYxcP1zDI498wKEaDfN8aQy3KvcWmGmoy7ZiVbWsd25S8I5dy3t+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ankVlM27RrcnL40DrN3o5WOeBoOUr801Vo9NiFptvlo=;
 b=pmQr9VGDjywG5y2xV2I9+z4U61+tTeX/gN5p3xYf7KSuFtRayX3W/CmdPDHQBLg6BCgGl2WKjVrtQ3tcoTms867t2hssosX63nbm510uABMvZQo90LtBv/QHQbkmKrOrrQCrcSiTuIs40kRjJwlIWjvb3AU3hqExWUfVI7DjhX0afEzeqaIhKnKRk+jxQE4Cz4BJRgN7P6zTgB8XCvg5+W7NDpg0v/imaIo1KNiF4SESB6NISLOifpEMHCjwRIsocl45MxqYDT96oW5sYbCAM9t5qgvvZ6t1T8rmIMPUJBy/om1DnxatelzV1bci2JA+xZY6U7TEpJduovYnynaLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ankVlM27RrcnL40DrN3o5WOeBoOUr801Vo9NiFptvlo=;
 b=caAS+u2ex62HCWgpD1lv+JgfzrZ9NljCcA0PtIz8PQ81dQGXjrbgw7vNFEzrm4JoSaGpIcH7WOyQ2ZZ2wUvtweCxYRK6WZWBcA5kTc6hWEMvQjSIcf4/sJmq5/Bwva3mhzdsLEHoPBGoicaPRCw8ZVXr7NQ844Uf8281Jz8tpAE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB5625.namprd10.prod.outlook.com (2603:10b6:510:f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Tue, 5 Nov
 2024 18:53:49 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 18:53:49 +0000
Date: Tue, 5 Nov 2024 13:53:45 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 4/6] usdt: typed args and arg mapping
Message-ID: <ZyppufnpOOJuaDxU@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
 <20241105000608.333229-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105000608.333229-5-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: ef23c2cb-7d00-4054-0746-08dcfdcb2ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dp5IngiE3aD/sO9XUtGlieY6gl8CCYA5JFNryEuZ1lS4i1WTkgz67mVsy5hM?=
 =?us-ascii?Q?jrrVqz/WDST5eu1asKmZYhxq7zRtnZegGe4z9gCT3FT5WJmJVltH0X5vgvdh?=
 =?us-ascii?Q?hayXlio6wusDEBQfGCDKwmFkt4SYmwY4JqlTKqSZJdFTt9kWQjUOSJLd7cD5?=
 =?us-ascii?Q?9b7mii6Mee5ojOZQMHYiWDWiiSQ2sKhZajXElBbaWr+lUg8Zsxwv/EKAtDuJ?=
 =?us-ascii?Q?2ED77i8DhABN++EW3NqN+jPQ2wzQVw1ZW8Mk7Q3KC+ectzXrPYZD01PK2hJd?=
 =?us-ascii?Q?LKgbEjIXJczIMI505vSWQgDhH1MCr+LmtHHMwk0us0uBBqQKi7v8Lt0FrLr4?=
 =?us-ascii?Q?UZAydb8P0ISQGPWY2hblfnqNslylvdskTm4b4buId6ZfkgeQYOiaEgtOc6WX?=
 =?us-ascii?Q?pohk+1+V03zwuTzscZl88UFp3iwKose/nS3zhuV/I1LBPeWlNhdKEI9Zq2Sb?=
 =?us-ascii?Q?WJX0gqUCScAoBTLvjkcMPmzZ5AtH6pAlkbMw6fLNhLUqjz/piufySl/NjZKa?=
 =?us-ascii?Q?p7yI5dvC/wHEBeVtPSYQ3UMffTCEuTiU0qfZ/nLycQIq9JmsJjCPCCSz9P9U?=
 =?us-ascii?Q?E7RrY8bufPMcDr/fSZrB2FxL9z97Ge8CS3eX10XQ6GJXyiaMj38iYZL0OH4n?=
 =?us-ascii?Q?VeERaJm8IsTOlEAJ+6ktrGFOXu/X4mrw255X4wDUhNKW0gcTdOIDSvt/TJvM?=
 =?us-ascii?Q?8kAC1tmaEsTM5Lpcq8FUG511qsc1emTxEcs3La9g3IoUL2wxWzL/z7y3rdOs?=
 =?us-ascii?Q?hpFv8gyn5uwweiMtbHdz0cqn6/uyo/iVywbJfTsiaOnAXWa+aeJiQhCsuCJZ?=
 =?us-ascii?Q?rWvbJOo0A9PF4VAQlawriZGkEZNxP6jR8FJxOwpeT+Ih77dn8uAtPywPGj5Q?=
 =?us-ascii?Q?I5/gIP1LnZlcGjtRSaN90mx6OYD56xbi8SbAfyTwXcvnSkkmXd0Oy9n66WwO?=
 =?us-ascii?Q?NgYzLsS5FN+FuNf961mmCsN6GyDhoUl2jSKZDn+GrwFG0Nnh7/q37hiLAwKq?=
 =?us-ascii?Q?LlwQyCPnK+MF56ACvNR9L13U0Tc9xLwx1S0EwQZaBW2slq28c+SA3Qy4mWaQ?=
 =?us-ascii?Q?d9DI8TQJjQ6dX6Uq8H+mO9Qwtw2ai5C6ma2BW6jKmLPtgJy6eLTNEePKBzBz?=
 =?us-ascii?Q?3E0Y5QyMcSapjNoF1EaLV9TxUXSEVcCOiAQUl/PE2E8TCDwpDB+g+NfDfnLC?=
 =?us-ascii?Q?sge+27yhO4x5fIKdB/wpFvGMQXCIrPaGTjbLvnUSUcEaDdFE3TngDrHk5yLZ?=
 =?us-ascii?Q?9+lgRsWrGHA9UL++dQu8KNIREq3HW3QSwS0vjuiZulcF4mNMhcZ/mp1auZ6u?=
 =?us-ascii?Q?Uuc+FcYo4VJgneoAs79mn4eI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1B2+y7hKvLkphLJwmEDhMfMlwgYgZlGp67a1yg7QLRaAxA/idUjOWQTcU2i?=
 =?us-ascii?Q?N79le/bUe9rJd+YH3J5xTOYDKQItGsbJMWS9e36wh8Hi7h/9KflW44ZsDfb2?=
 =?us-ascii?Q?XcVpvH9CEE0TCiU2L2eUKKJQBl9JH1kIU+rP6NT/ENiAshf9Rv5RUBfciE8U?=
 =?us-ascii?Q?rm0bwZ0sEz9YYIf0Hh9D3PyrTKTDWwAHgIhScf8lRBC3rQrySkSzjCYRvYV1?=
 =?us-ascii?Q?dtNeePMMEXam8m3QnQJnx2SYFjl+8X4vKmE2wGXMtU3MRB8yhwHsG8sfbRNr?=
 =?us-ascii?Q?GbQvkd0NkTnHew7pcfzR0rbK9oUTMbWj53OcgDjmk30lvBIkYIh7s6R9+VAY?=
 =?us-ascii?Q?4KvVmDkvvCeubNnLX4IM38QT6ZfqIF4zPUN57nF1z6hQr/JOxIe6mgjA1UfZ?=
 =?us-ascii?Q?/2KOSoW1Q8CvlLZkU2cy8iKjk3ytVgsWfay2wd58qAcjF7zy9l4MYZg9nrhm?=
 =?us-ascii?Q?e8cH5gkTDQJzXjOrCpCf77dBQyfRpatX6fnQnhpzURc+/lwiQ7VbR/HjczH+?=
 =?us-ascii?Q?f0wMrLXdOpUcm5Mguo6QC1Jq9PbrMYkvNGKvwwgX4mdmVjZxc1Wkzh9SL8JN?=
 =?us-ascii?Q?83gx+52b26q/PO8F4ab95Ife0Z1E2FTx8eC2t3V7MN7T+RcIrN4RKjsQb6YM?=
 =?us-ascii?Q?/s64ZiWi/i/geqVaV4KhVkSkj6cR+0Jht6IWhz19OWrgNSGDzLQMSBgEVc6U?=
 =?us-ascii?Q?/oxz+oqtqUB5FYXLobOBKBRYZ8DJVajznhkYKYr18vAPs+Flg0tcYukvLgD3?=
 =?us-ascii?Q?8oF+aRz4VflXOk37JvbbkeFJ0HMbcdAMA+aE/Cb7kOZalECafOzM15VBXPky?=
 =?us-ascii?Q?QKynBOBwoOuT9LT6xSAEd4Xvh8Qm7kjHtBcTcEsPo8yBgFop3SF1kGJ36hY/?=
 =?us-ascii?Q?u+0cqmmwC7hLaK66AUE02we3rkJfoDyBzXMc5O9GPUwow7iBIj1nhcq+0lPC?=
 =?us-ascii?Q?lMPLDuhqDoj0iTMkdqzEp0NEktlSe8V51JS+RZKhSfOag+0M2rHw0fKlGDoy?=
 =?us-ascii?Q?677P4fSFeeij+EzHZ8er95IlI/WSG35rqra91efuKqlwQL8PQhCxzt/yWI/W?=
 =?us-ascii?Q?d/nGPV20pFWnNqADNlGKu5r9IojyCwtAJ3ljuv/npeAxpoVNYd2fKhS+/jU2?=
 =?us-ascii?Q?f5/+ZAYZTPuWj29brcd2ySvjpGhvIztLGjnipiSkisLWZPbdue/AbENVMlgw?=
 =?us-ascii?Q?zqDEMwjqUBUdhEaqLbOG0FtLEZQxUwAYk4cIPnn03EIdqy60hjZr18POT1IB?=
 =?us-ascii?Q?oZ/oGgupwxUAtV01pxTmnU4OldCj7wlH86yLH5OtQKubmaIPNvm13xw9sFby?=
 =?us-ascii?Q?MBzhQ7MOYNTaA5OHmsFx0dYfYpd0tCdocohqzU7Z+7EM1jt1xavcMI1DPcgx?=
 =?us-ascii?Q?/4Y+M0K8PgOpFxAwz1BrzHSuy3GousdLk59sPPuJ3xL/XheZJxxiqDDGt1G7?=
 =?us-ascii?Q?REE9mSQcoVsY3x2JN44cD3PEeF3r2bzX4MSvwgkxbpMB1NqhMTYnOXbPHE98?=
 =?us-ascii?Q?AAj5a4wmw8s5NWO3ryee2jAZgz3AXPEj/CGd0DtEFeJId1XbfSa6fOvlRssm?=
 =?us-ascii?Q?H0xc0q2QUqjEr6jVowR0huqxOvMh9pSYEVDdBCyXw53J6+PDCi12lXbFXXir?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZMG62M8Il0g5Gt4uzn07WxlI0Hk/RkoqZp8rqxBoQb6rmijYxZk3z3y5KY8Q8+IbckAQ9Cko5HGRIqil5BpkAvuFcRm8P/RBFzSG5gENGI543oDFVP3lXArTiAxAyDQFPy1f2xWhwm2vMXNXwGSwOVvrm+3j/0qziyxxg4CgmeNA9yfYKpvuly464REL2+PcNIoj7v2fyDMk9NEChvSIWAhv5IHbvDW3/+tbZ890FaPNsqk3IeWpsDk/oijl1zBiE12RBPBu2Jm6DeZwULxjwqHMKFovk0lAkDKkedUranF1BNVohp9TmwHNm7DzXjoGMAInOmNFWqUNtBhYdN1DtorL8dVSjTd35YodXC3LzwFtppAQ7IKVfnEE2DzMvVHu1O6t/1OjUF/0z4cP3BUJJptrgw477rci8KOgYd9Katy6IJ1h/uD9dGA7+o5F5J9LOV9QEk6zPnnNAVDUY7p7T4ES8O6ZcpUOg1FJI+5/1m5gEC9vic47I5BQUO4vlNVI1DocpCfNWFH/fFtO88gybDjI/b/weW7aubzokq29+gomlGkkSDi2fv9E94dlooprJrhe10HH3EzGCDlhM7Tv/9m44jm/M1PaVZKCzfqNDWQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef23c2cb-7d00-4054-0746-08dcfdcb2ef5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:53:49.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp5Ve8r/BjtEPjP0EGK9gk7Lr/2uHg2r4vP+j/g3+im3tydin0qEAg1zcRioajQyiVfKgN5oU7lrJ+muVV44MWRaXWhO7uNI/1qy0gf6lP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5625
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050145
X-Proofpoint-GUID: suRCY_gKO3xD6DFleiZER87_JdCy4PEw
X-Proofpoint-ORIG-GUID: suRCY_gKO3xD6DFleiZER87_JdCy4PEw

On Tue, Nov 05, 2024 at 12:06:06AM +0000, Nick Alcock wrote:
> This change propagates the arg type and mapping info we just got into the
> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
> types before handing off a 1:1 mapping to the dt_probe_t, and calls
> dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
> probes should now have visible types which obey the :-notation translators
> specified in their .d fils (this is now tested).

Not sure why I didn't catch this earlier but this is confusing (or possibly
wrong?)...  Perhaps the problem is that you are trying to put too much into a
single summary sentence.

There is no shuffling of native types.

What happens (based on my reading of the code) is that:

- arg data in pid_probespec_t is propagated into the underlying dt_uprobe_t
  where it is stored as a dt_argdesc_t array
- the trampoline shuffles the argument values according to the mapping data
  in the underlying probe
- calls to probe_info() retrieve arg data as a dt_argdesc_t array with 1:1
  mapping (because the trace program can only access arguments after they
  were already mapped)

Also.... "fils" -> "file"

> The probe info has been moved from the underlying probe to the overlying one

"probe info" -> "probe info hook"

> as part of this: underlying probes don't have any user-visible args to
> get info for, and their probe_info functions are never called.  We do all
> the arg reshuffling in a function ultimately called from USDT probe

There is no arg reshuffling or shuffling... all that happens is that the
dt_argdesc_t array is populated.

> discovery via provide_underlying, so it predates trampoline setup let alone
> probe_info on the overlying probe and all the args info is present before
> it is needed.  (We intentionally do not shuffle the args in
> dt_cg_tramp_map_args specifically so that we are not sensitive to the

Actually, dt_cg_tramp_map_args() specifically *does* the arg shuffling (the
mapping of args).  That is its sole purpose.

> relative call order of trampoline() versus probe_info(), but there's no
> escaping the requirement for USDT probe discovery to predate all of this:
> but this was already a requirement in any case.)

There is no call order relation in any way between trampoline and probe_info.
In fact, except for some special providers that do not have a low-level probe
implementation component, trampolines are not generated until all olauses have
been copiled.
> 
> We make one assumption for simplicity, noted by a TODO in the source.
> We assume that overlying probes all have the same native types and mappings,
> so we don't need to look at more than one underlying probe to figure out what
> they are.  DTrace always generates such a thing, but DOF specifying multiple
> overlapping probes seems perfectly possible for other programs to generate.
> This should probably be validated in dof_parser.c in future.

Since you added validation that rejects multiple USDT probes using the same
tracepoint (underlying probe), this is a moot point.  There is no assumption
anymore in any case.  Any underlying probe can only be associated with a single
overlying probe, so storing the arg data in the underlying probe is valid.

If you feel the need to mention that other DOF generators could potentially
create DOF that associates multiple overying probes with the same underlying
probe. that's fine, but since your code will not accept that, I don't think
there is a need to mention it.

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  include/dtrace/pid.h                          |   1 +
>  libdtrace/dt_pid.c                            |   3 +-
>  libdtrace/dt_prov_uprobe.c                    | 185 ++++++++++++++++--
>  test/triggers/usdt-tst-argmap-prov.d          |   5 +-
>  test/triggers/usdt-tst-argmap.c               |   5 +-
>  .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
>  .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
>  .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 ++++++++
>  test/unittest/usdt/err.argmap-null.d          |  41 ++++
>  test/unittest/usdt/err.argmap-null.r          |   2 +
>  test/unittest/usdt/err.argmap-null.r.p        |   2 +
>  test/unittest/usdt/tst.argmap-null.d          |  32 +++
>  test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
>  test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
>  test/unittest/usdt/tst.argmap.d               |   5 +-
>  15 files changed, 478 insertions(+), 19 deletions(-)
>  create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
>  create mode 100644 test/unittest/usdt/err.argmap-null.d
>  create mode 100644 test/unittest/usdt/err.argmap-null.r
>  create mode 100755 test/unittest/usdt/err.argmap-null.r.p
>  create mode 100644 test/unittest/usdt/tst.argmap-null.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed.d
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 25bfacfdbfe2..c53e600475df 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -22,6 +22,7 @@ typedef enum pid_probetype {
>  	DTPPT_ENTRY,
>  	DTPPT_RETURN,
>  	DTPPT_OFFSETS,
> +	DTPPT_USDT,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
>  
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 71ac1754d343..a0b3d892fd23 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  
>  			p += args->size;
>  			seen_size += args->size;
> +			args = (dof_parsed_t *) p;

This change belongs in patch 1/6...  without it that 1/6 patch is validating
the wrong data.

>  
>  			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
>  						 dof_buf_size, seen_size))
> @@ -1000,7 +1001,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  				goto oom;
>  			}
>  
> -			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_OFFSETS;
> +			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_USDT;
>  			psp.pps_prv = prv;
>  			psp.pps_mod = mod;
>  			psp.pps_fun = fun;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index a8c1ab2761f0..28f5351be21a 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -46,9 +46,11 @@
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
>  
> -#define PP_IS_RETURN	1
> -#define PP_IS_FUNCALL	2
> -#define PP_IS_ENABLED	4
> +#define PP_IS_RETURN	0x1
> +#define PP_IS_FUNCALL	0x2
> +#define PP_IS_ENABLED	0x4
> +#define PP_IS_USDT	0x8
> +#define PP_IS_MAPPED	0x10
>  
>  typedef struct dt_uprobe {
>  	dev_t		dev;
> @@ -57,7 +59,10 @@ typedef struct dt_uprobe {
>  	uint64_t	off;
>  	int		flags;
>  	tp_probe_t	*tp;
> -	dt_list_t	probes;		/* pid/USDT probes triggered by it */
> +	int		argc;		   /* number of args */
> +	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
> +	char		*argvbuf;	   /* arg strtab */
> +	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
>  } dt_uprobe_t;
>  
>  typedef struct list_probe {
> @@ -123,6 +128,8 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
>  	dt_tp_destroy(dtp, tpp);
>  	free_probe_list(dtp, dt_list_next(&upp->probes));
>  	dt_free(dtp, upp->fn);
> +	dt_free(dtp, upp->args);
> +	dt_free(dtp, upp->argvbuf);
>  	dt_free(dtp, upp);
>  }
>  
> @@ -516,6 +523,83 @@ static int discover(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/*
> + * Populate args for an underlying probe.  This really relates to an overlying
> + * USDT probe (all overlying probes associated with a given underlying probe
> + * must have the same args), but the overlying probe doesn't exist at the point
> + * this is populated, so we must put it in the underlying probe instead and pull
> + * it out when the overlying probe info is called for.

"all overlying probes associated with a given underlying probe" makes little
sense when it is already established (ad code guarantees) that there will
only be a single overlying USDT probe for any underlying probe - and any other
overlying probe is therefore a pid probe and does not have defined arguments.

Pehaps better would be:

/*
 * Populate args for an underlying probe for use by the overlying USDT probe.
 * The overlying probe does not exist yet at this point, so the arg data is
 * stored in the underlying probe instead and will be accessed when probe_info
 * is called in the overlying probe.

> + *
> + * Move it into dt_argdesc_t's for use later on. The char *'s in that structure
> + * are pointers into the argvbuf array, which is a straight concatenated copy of
> + * the nargc/xargc in the pid_probespec_t.

nargc/xargc -> nargv/xargv

> + */
> +static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
> +			 dt_uprobe_t *upp)
> +{
> +	char	**nargv = NULL;
> +	char	*nptr = NULL, *xptr = NULL;
> +	size_t	i;
> +
> +	upp->argc = psp->pps_xargc;
> +
> +	/*
> +	 * If we have a nonzero number of args, we always have at least one narg
> +	 * and at least one xarg.  Double-check to be sure.  (These are not
> +	 * populated, and thus left 0/NULL, for non-USDT probes.)
> +	 */
> +	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
> +		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
> +		return 0;
> +
> +	upp->argvbuf = dt_alloc(dtp, psp->pps_xargvlen + psp->pps_nargvlen);
> +	if(upp->argvbuf == NULL)
> +		return -1;
> +	memcpy(upp->argvbuf, psp->pps_xargv, psp->pps_xargvlen);
> +	xptr = upp->argvbuf;
> +
> +	memcpy(upp->argvbuf + psp->pps_xargvlen, psp->pps_nargv, psp->pps_nargvlen);
> +	nptr = upp->argvbuf + psp->pps_xargvlen;
> +
> +	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
> +	if (upp->args == NULL)
> +		return -1;
> +
> +	/*
> +	 * Construct an array to allow accessing native args by index.
> +	 */
> +

Remove blank line.

> +	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
> +		goto fail;
> +
> +	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
> +		nargv[i] = nptr;
> +
> +        /*
> +	 * Fill up the upp->args array based on xargs.  If this indicates that
> +	 * mapping is needed, note as much.
> +	 */
> +

Remove blank line.

> +	for (i = 0; i < upp->argc; i++, xptr += strlen(xptr) + 1) {
> +		int map_arg = psp->pps_argmap[i];
> +
> +		upp->args[i].native = nargv[map_arg];
> +		upp->args[i].xlate = xptr;
> +		upp->args[i].mapping = map_arg;
> +		upp->args[i].flags = 0;
> +
> +                if (i != map_arg)
> +			upp->flags |= PP_IS_MAPPED;
> +	}
> +
> +	free(nargv);
> +	return 0;
> +
> + fail:
> +	free(nargv);
> +	return -1;
> +}
> +
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
>   * uprobe.  Since multiple pid and USDT probes may all map onto the same
> @@ -530,7 +614,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
> -	dt_uprobe_t		*upp;
> +	dt_uprobe_t		*upp = NULL;
>  
>  	/*
>  	 * The underlying probes (uprobes) represent the tracepoints that pid
> @@ -555,6 +639,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_IS_ENABLED:
>  	case DTPPT_ENTRY:
>  	case DTPPT_OFFSETS:
> +	case DTPPT_USDT:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
>  		break;
>  	default:
> @@ -568,6 +653,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.fun = psp->pps_fun;
>  	pd.prb = prb;
>  
> +	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> +		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
>  	uprp = dt_probe_lookup(dtp, &pd);
>  	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
> @@ -591,12 +678,24 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  			goto fail;
>  
>  		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
> -				      upp);
> +				       upp);
>  		if (uprp == NULL)
>  			goto fail;
>  	} else
>  		upp = uprp->prv_data;
>  
> +	/*
> +	 * Only one USDT probe can correspond to each underlying probe.
> +	 */
> +	if (psp->pps_type == DTPPT_USDT && upp->flags == PP_IS_USDT) {
> +		dt_dprintf("Found overlapping USDT probe at %lx/%lx/%lx/%s\n",
> +			   upp->dev, upp->inum, upp->off, upp->fn);
> +		goto fail;
> +	}
> +
> +	if (populate_args(dtp, psp, upp) < 0)
> +		goto fail;

Why bother calling this for a non-USDT probe?
I would use:
	if ( psp->pps_type == DTPPT_USD && populate_args(dtp, psp, upp) < 0)

> +
>  	switch (psp->pps_type) {
>  	case DTPPT_RETURN:
>  	    upp->flags |= PP_IS_RETURN;
> @@ -604,15 +703,19 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_IS_ENABLED:
>  	    upp->flags |= PP_IS_ENABLED;
>  	    break;
> +	case DTPPT_USDT:
> +	    upp->flags |= PP_IS_USDT;
> +	    break;
>  	default: ;
>  	    /*
>  	     * No flags needed for other types.
>  	     */
>  	}
> -

I would leave the blank line.

>  	return uprp;
>  
>  fail:
> +	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
> +		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
>  	probe_destroy(dtp, upp);
>  	return NULL;
>  }
> @@ -732,7 +835,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  
>  static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  {
> -	if (psp->pps_type != DTPPT_OFFSETS &&
> +	if (psp->pps_type != DTPPT_USDT &&
>  	    psp->pps_type != DTPPT_IS_ENABLED) {
>  		dt_dprintf("pid: unknown USDT probe type %i\n", psp->pps_type);
>  		return -1;
> @@ -786,7 +889,12 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   *	int dt_uprobe(dt_pt_regs *regs)
>   *
>   * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
> - * the firing of all dependent pid* probes and their clauses.
> + * the firing of all dependent pid* and USDT probes and their clauses, or (in
> + * the case of is-enabled probes), do the necessary copying (is-enabled probes
> + * have no associated clauses and their behaviour is hardwired).
> + *
> + * Trampolines associated with USDT probes will also arrange for argument
> + * shuffling if the argmap array calls for it.

I would drop this since you mention the napping in a comment below already.
Here is is potentially confusing because trampolines are associated with the
underlying probe, and that probe might have both pid probes and a USDT probe
associated with it.

>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> @@ -864,7 +972,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	}
>  
>  	/*
> -	 * USDT
> +	 * USDT.
>  	 */
>  
>  	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
> @@ -873,6 +981,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  	dt_cg_tramp_copy_args_from_regs(pcb, 0);
>  
> +	/*
> +	 * Apply arg mappings, if needed.
> +	 */
> +	if (upp->flags & PP_IS_MAPPED) {
> +
> +		/* dt_cg_tramp_map_args() works from the saved args. */
> +		dt_cg_tramp_save_args(pcb);
> +		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
> +	}
> +
>  	/*
>  	 * Retrieve the PID of the process that caused the probe to fire.
>  	 */
> @@ -1083,8 +1201,49 @@ attach_bpf:
>  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
> -	*argcp = 0;			/* no known arguments */
> -	*argvp = NULL;
> +	size_t		i;
> +	list_probe_t	*pup = prp->prv_data;
> +	dt_uprobe_t	*upp;
> +	size_t		argc = 0;
> +	dt_argdesc_t	*argv = NULL;
> +
> +	/* No underlying probes?  No args.  */
> +	if (!pup)
> +		goto done;
> +
> +	upp = pup->probe->prv_data;
> +	if (!upp || upp->args == NULL)
> +		goto done;
> +
> +	argc = upp->argc;
> +

Remove blank line.

> +	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
> +	if (argv == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +
> +	for (i = 0; i < argc; i++) {
> +		argv[i].native = strdup(upp->args[i].native);
> +		if (upp->args[i].xlate)
> +			argv[i].xlate = strdup(upp->args[i].xlate);
> +		argv[i].mapping = i;
> +

Perhaps add a comment here that this is code to handle an allocation failure?
Or move this to the end of the function with a fail: label, and goto to that
if allocation fails (since that makes it more obvious that this is code to
handle an allocation failure).

> +		if (argv[i].native == NULL ||
> +		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL)) {
> +			size_t j;
> +
> +			for (j = 0; j <= i; j++) {
> +				free((char *) argv[i].native);
> +				free((char *) argv[i].xlate);
> +			}
> +
> +			dt_free(dtp, argv);
> +			return dt_set_errno(dtp, EDT_NOMEM);
> +		}
> +	}
> +
> +done:
> +	*argcp = argc;
> +	*argvp = argv;
>  
>  	return 0;
>  }
> @@ -1152,7 +1311,6 @@ dt_provimpl_t	dt_uprobe = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
>  	.add_probe	= &add_probe_uprobe,
> @@ -1178,6 +1336,7 @@ dt_provimpl_t	dt_usdt = {
>  	.populate	= &populate_usdt,
>  	.provide_probe	= &provide_usdt_probe,
>  	.enable		= &enable_usdt,
> +	.probe_info	= &probe_info,
>  	.probe_destroy	= &probe_destroy,
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
> diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
> index 28134baa6fa3..d8c3e88c4616 100644
> --- a/test/triggers/usdt-tst-argmap-prov.d
> +++ b/test/triggers/usdt-tst-argmap-prov.d
> @@ -1,10 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  provider test_prov {
>  	probe place(int i, int j) : (int j, int i, int i, int j);
> +	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
> +	probe place3(int i, char *j) : (char *j);
> +	probe place4(int i, char *j) : ();

It might be worth adding tests for -lvn for all these cases, as an extra
check that probe info is being provided correctly, even in the case where we
do not actually trace.

>  };
> diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
> index 89a0a53fc1d5..9244092514ff 100644
> --- a/test/triggers/usdt-tst-argmap.c
> +++ b/test/triggers/usdt-tst-argmap.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,6 +12,9 @@ main(int argc, char **argv)
>  {
>  	for (;;) {
>  		DTRACE_PROBE2(test_prov, place, 10, 4);
> +		DTRACE_PROBE(test_prov, place2, 255, "foo");
> +		DTRACE_PROBE(test_prov, place3, 126, "bar");
> +		DTRACE_PROBE(test_prov, place4, 204, "baz");
>  	}
>  
>  	return 0;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> new file mode 100644
> index 000000000000..8bcfa92ff6b0
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> @@ -0,0 +1,34 @@
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> new file mode 100755
> index 000000000000..c575983adf65
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sed -rf
> +s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> new file mode 100755
> index 000000000000..ad8dc2e7c267
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> @@ -0,0 +1,83 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +##
> +#
> +# ASSERTION:
> +# Testing -lvn option with USDT probes with a valid probe name.
> +#
> +# SECTION: dtrace Utility/-ln Option
> +#
> +##
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go(int a, char *b) : (char *b, int a);
> +};
> +EOF
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >& 2
> +	exit 1
> +fi
> +
> +cat > test.c <<EOF
> +#include <sys/types.h>
> +#include "prov.h"
> +
> +int
> +main(int argc, char **argv)
> +{
> +	TEST_PROV_GO(666, "foo");
> +	sleep(10);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +${CC} ${CFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +script()
> +{
> +	$dtrace -c ./test -lvn 'test_prov$target:::go'
> +	./test &
> +	PID=$!
> +	disown %+
> +	$dtrace -p $PID -lvn 'test_prov$target:::go'
> +	kill -9 $PID
> +}
> +
> +script
> +status=$?
> +
> +exit $status
> diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
> new file mode 100644
> index 000000000000..ba765bea7a04
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.d
> @@ -0,0 +1,41 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that a probe left with no args at all due to mapping
> + *            has no args.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place4
> +/args[0] != 204 || args[0] == 204/
> +{
> +	printf("this should never happen");
> +	exit(1);
> +}
> +
> +test_prov$1:::place4
> +{
> +	printf("nor should this");
> +	exit(1);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
> new file mode 100644
> index 000000000000..215475e39b48
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
> diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
> new file mode 100755
> index 000000000000..c575983adf65
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sed -rf
> +s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
> new file mode 100644
> index 000000000000..dacf4c4f569a
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-null.d
> @@ -0,0 +1,32 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that you can map to no args at all.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place4
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
> new file mode 100644
> index 000000000000..8c4d7273c0ab
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed-partial.d
> @@ -0,0 +1,49 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that args[N] variables are properly typed when mapped,
> + *            even if some args are unused.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place3
> +/stringof(args[0]) != "bar"/
> +{
> +	printf("arg is %s; should be \"bar\"",
> +	    stringof(args[0]));
> +	exit(1);
> +}
> +
> +test_prov$1:::place3
> +/stringof(copyinstr(arg0)) != "bar"/
> +{
> +	printf("arg is %s; should be \"bar\"",
> +	    stringof(copyinstr(arg0)));
> +	exit(1);
> +}
> +
> +test_prov$1:::place3
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
> new file mode 100644
> index 000000000000..1243e059b8ae
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed.d
> @@ -0,0 +1,48 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that args[N] variables are properly typed when mapped.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place2
> +/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
> +{
> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> +	    stringof(args[0]), args[1], args[2], stringof(args[3]));
> +	exit(1);
> +}
> +
> +test_prov$1:::place2
> +/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
> +{
> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> +	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
> +	exit(1);
> +}
> +
> +test_prov$1:::place2
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
> index 7896dc07e0e2..a7d68da3dfbc 100644
> --- a/test/unittest/usdt/tst.argmap.d
> +++ b/test/unittest/usdt/tst.argmap.d
> @@ -1,17 +1,16 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
>  /* @@trigger: usdt-tst-argmap */
>  /* @@trigger-timing: before */
>  /* @@runtest-opts: $_pid */
>  
>  /*
> - * ASSERTION: Verify that argN and args[N] variables are properly remapped.
> + * ASSERTION: Verify that argN and args[N] variables are properly mapped.
>   */
>  
>  BEGIN
> -- 
> 2.46.0.278.g36e3a12567
> 
