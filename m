Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28719475
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017526; cv=fail; b=a+YpgL4IO1ZuV9ECP5JGgXoDTqb4K1YXaEkaRYeBsfaayyyl/qaVWkZ6n6n2U15ekfLHZXYUSu/A1QUa7SshAEwi8dBTbf+VKYgdRsg3BLcWUAN4NQMv6j1423FXiiLPYvi6WQZHLLs4V6l3pKz74twedM6ctyXSbjYKjSeflFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017526; c=relaxed/simple;
	bh=+Peqt8QB2YA4MCmO+cw89hBvyMrMSsjAX4mpBNImoBs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AFDjdXeH+r9oZt5VXye7NBNI2LI/PY8jAYri3M/27pExfSJlpeLcFNUbfH8yIfhAKVH+RRVbG9Og+0XAJ+oT4SjllvgtQYjpsvBzlIXy3qD/fH0aTzRQ9PDluG4AxiwM2Gd5sZZ2xswMe26Gh4mx9G5qhNvjjz8LJHCIVZ/XyPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d47PcN36; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cngewS9T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d47PcN36";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cngewS9T"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tdKx022826
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=3QG95MXEhUPxLQ3cTHR367P+1Q3gNc4awNgzeCOFIh4=; b=
	d47PcN36L+J+t74+L5SaArpBHz8fmMTzykV+UL/vaL6Fy9ntYYpy0q/m+AqHx75O
	L8kullNAtKjUZDiWk4eHqytkEH8UYNNHcvvpSGsx+kg0oaN2F7MhMfpbQvoT5Gli
	0r1+dPp8Nng76YAWNXgA+OBQpXmMQxvJ2AtVvW36KyDG0CFCZ2c3bD0W6wHltoUn
	tZA1eLPdRwOhZt12Qu5A6KNqcWQ3G3j8RpeI9kpc7fTP50or6m6w2P8BBM1yPY8a
	grEDdoUqbp9zL+9a4bSyRYTi4D2o6rx/QFw1b4gZn/vx3MpDS2WT7DaPN2UkN6EO
	LvfwOPrdef77kuZbXeTIyQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4220490tj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:52:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4944Dej9038494
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:52:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422054se2g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eozTmyqGTTynicpTpBL0qvKUd96w9seobI997tHsaehQVEx7ORVjtHgEs9z8LVEs2cC7Zi5VLsfFG+c7WsS9HYXaduzYBEnZy+spBCPmnppzv0/HKhIa//FzFJ1ZmjhlhZWebk17WlvFYymi16l82daB3tR0ytlh3dvFitjnN0SW6pWP57F8kX5RBQTpELFQDD4Hr6zGUwXhSh4KwTB+9tWLVrg0iJvDBNpZxHF6IyZ9vaybuJNZR6cS5gA7v7BCenAJegdloO6EwuNZgWyJAdJG5kIOQpKQ56b6elBe9xp/tzqKTGTTyKNvezvndGdVcfmhG4yRK59c99p0Ua4zLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QG95MXEhUPxLQ3cTHR367P+1Q3gNc4awNgzeCOFIh4=;
 b=mri3wqbDG6OyIfoA+OlODhRwNSVlCytyrxCAylZ+su504cVehHe7ALfRcHXZrC+wS3mmKGhPmEq2NsGjU/eCGxLP2Ds46FSYOiw590RfImyDt2l27DBdkoD1fvM2bc/gZFQ5QpHkTz7kwlCJXp2N+mcqfkNGn7dbu3DyeR9NaBpYAF2o4SRpEDlwSgxmQRwJJPlkT3KSL44nSeDuYui+l8fN6KfGtTAHZPs+vZs0k2eNLBSl1rg3W0QE3MnuZ78f9GKcSUIRXoNYKsLW5u3IxCekMPvB0nwYs7y9TjI2FfcdOwmwKFaB5R0y/+cNyYUPpmeAMLS9dODLO1UsrglijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QG95MXEhUPxLQ3cTHR367P+1Q3gNc4awNgzeCOFIh4=;
 b=cngewS9TqDscmWub1lnXHF2n594/mMOcOQuGK/r4+DWFjg0hkkcIfxeOAREsQ2HiSMwFVYs5yjEMDQgDBBZBE78FvyqodfVXfjSWhLsH4VRO8FAzTHXHg+lv8JTkHSFT+Oof8p1AP1vkzhWV1vHDiNsTTd+1fTMH7UWCTOmzn/c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4464.namprd10.prod.outlook.com (2603:10b6:a03:2d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:51:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:51:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 17/19] test: Add a pid-USDT test
Date: Fri,  4 Oct 2024 00:51:57 -0400
Message-Id: <20241004045157.26120-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: 49792491-5eba-4917-53fe-08dce43047dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JucS+aBakGqX7bnVmP5sGx4mUiMMk/J+KFy7vHlUXKPADCcHj0WJh28fj7M0?=
 =?us-ascii?Q?Z1eQLXNz4IOyxdjBVgPptC0i5/2oXSUom6LNoxnQSxucEhmJC/mIKDw5rRVi?=
 =?us-ascii?Q?wvs6Fy1U6tbSd0Gmddcare9eQ7/HIZ0FjYZwy1UPBQa8hxD3fGWtirVpwCsr?=
 =?us-ascii?Q?sFfHXPgTEToK9I1/pwhXEIRQsLE1XPrGi6V7BTEs0b6phiUatHFhpVn5nLex?=
 =?us-ascii?Q?qqN9VtXG8UEFBDMQj1LnYwyia4fRFcvHOJ+Z2HIwzB3UY3mD3cehBFhBVPC8?=
 =?us-ascii?Q?AfoJX/DIFAoCXT5MozKhoXLzwhj6pM+Ct/aDqrugkRbnRgMYxjOQomE4CgCl?=
 =?us-ascii?Q?2cz8SBbCl169PgcXo57I/RN0f5v5N6hQg2M77neTIO37noGOK5qWPcSNYCEC?=
 =?us-ascii?Q?H8iwuDlEJD28b8NIUE95QeVcDu6dKGTfuKK+Q41El2ge5EX7Yrc9R4vKnevQ?=
 =?us-ascii?Q?E/QCZ8j3T0XtYvpKRZ/aGvrlp6H9wo+1SYlA8WToHJb4k8HiYeSwxHcalTHJ?=
 =?us-ascii?Q?P0mO6HTNT+gPNtWJs6cvteGDJHZn75luIpy3EU5YkB2KXwV6Rkp2FzKZ7bmG?=
 =?us-ascii?Q?0eMCPlISgmOwp5APa5oTd7xd5f2dSEqnxVVQXDcBUqFc0/5QCVr/TtcNKCDh?=
 =?us-ascii?Q?jI1RYqxUmLinT3OnkWzc2/DEyPvs8HmswQp53RPim8wgu+60dI1+TopYsCCx?=
 =?us-ascii?Q?nrUhBqeVCKFfggjgUT1LsiJL6hIbvogmmA41GbqAHcWhGkNuM+ir0YlpmK6G?=
 =?us-ascii?Q?UqLEEOho+RDZBTbNZRPJ/xaFbfkPF6P+3kK0xOpqbyKgQXNHHUsg9BtwKXcQ?=
 =?us-ascii?Q?ncyl8vD6vFqCaD7y7rCmgsQqvuDhj9HsPcdjJq3tPJGly3uIhfI8vQbDuV6E?=
 =?us-ascii?Q?q9Zv7NPMOEXVo3zGnmR2ZQo0ZMpugIgyuZ/35LGwCqDC/zb9iDcrKiWdcweN?=
 =?us-ascii?Q?OxdqhtOB0abFjVmsCgbcA5y/FP+ed8yaRhp9B17YsKSF6m6g10TC+efZUgg9?=
 =?us-ascii?Q?W6MOSqPu9U2eX4gZ3WDwqGoOD8c0bYpWOo5NyOxhnMwhOAGos0WnIbSL/054?=
 =?us-ascii?Q?ky0r8nquIuCTXfMrbjm0rSeu3jB71hfCG+WbrmyM12OP/HcBr752tVtbx0qM?=
 =?us-ascii?Q?cAktUPwFZSq/Npylb+2oFldyXzxcLY8RfNruGgdHmL0GH+gTXJcmtuB0dsVy?=
 =?us-ascii?Q?zawrWL+pNZnol7wP8lRQ9UHBStBTnI7FbOHJQu+nqIVj7nbQAjZ6QTWR9pab?=
 =?us-ascii?Q?9dSpZ93USdxAb41NEowUAc/AlM32u6vCSvWpJT7Qxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cp6cgzgMzDWzfGh2lauZdNmxn40ILd0Uk9ksTU37FtKoiRM/6iQ2N7DNEtPL?=
 =?us-ascii?Q?oaJdJE2hmQk3zqX0qBpIdWfFqfPC9YIHr4gRGnfr9fT+i/el580Tr9uKyuPj?=
 =?us-ascii?Q?nADqWHuwN+FPTwCieYv4/GaXQEe5tHzguUqK5j6jzy4D9VIgaYhb7s4Hhrkt?=
 =?us-ascii?Q?rDR2hSm0STqJoMHDWPYFtgt34UaolVy0flxyp9xPXrB9YHr48HwITyA3OzW4?=
 =?us-ascii?Q?S+MXsfB185evK0QfqZrvknD2isT3bUMizLnJ9MKd097jQb3ruVrIK/1XD12q?=
 =?us-ascii?Q?gqVMTeIXFF7Ucr+UyYvCxmh0K5u7a7tlNLyKkDO1jn9KiWXGyeKtwT+O3Z5z?=
 =?us-ascii?Q?3cX0KmDTuQmQzPixCJenRZem/wC8Uf+McFjLUc4Ic+HpJq0vJiHF7CbTu+dW?=
 =?us-ascii?Q?g9PtvVfJ3uPsdw4qHscKgZUGTlra9Bgzoh/pEBRE6Z1DFJ0gLubByFtUnkNU?=
 =?us-ascii?Q?Zgtbfg8Xl3Gvza0ngdgo72o1utpQvIeXKJrhJafORGyhMe5TFuSzh8CACnZ0?=
 =?us-ascii?Q?ExQDB3MRIpyvQanvChom/9jxOGEo+RiBQdFv7aBnarBUpZtSWcEexK3E91E3?=
 =?us-ascii?Q?8fbs4Ufb+XZT5zHRf401x2LdM05PUPstXrCbnJuLIOJGQncXCVxbm+pKY8rW?=
 =?us-ascii?Q?ywmJVyD1i/AZn34NOWOl0fgsFjE5Ah4wPaFBct+ycvA15f1JLXXuMhHYASTI?=
 =?us-ascii?Q?jg00/vt/RYNFANzEGNgKUFwwkPD+K2wnmYs5p8BlQgHl9pONaf76m4iAFH4u?=
 =?us-ascii?Q?RCXPKSdu0v1RFslJcc9wBHoIrIB5JTkNnQLBpmc8Tq1eeEaTYIUHvzmR9akH?=
 =?us-ascii?Q?NjY4DtAaCgx3gOlaZlvRrUipbBH/DHfw8g/EWokszq7Z7WH0nFFecOOlpDk1?=
 =?us-ascii?Q?YENc02/ws6Unh9YqZafizb1j4XfJVhKETNCG1Wc/T+bCd+EaNLSnCJvGZ2s6?=
 =?us-ascii?Q?dx9+1YGtboPQJPDRub4Na43FtrhxrP+3N4nWVSpOaAZlAoDxtKDU64hRZdym?=
 =?us-ascii?Q?n+dsTTWeEGfPi7XjWzdCJFT1ZZ2gROqeIqI4K9y4MTidqnlGY15RgotmAlTi?=
 =?us-ascii?Q?6IBcKai8OsN7uLVjgTp9rjrU1bqYYF7oWiIBWzCetIDongaNQIjc8A71eIaU?=
 =?us-ascii?Q?Bvo+uFvWrb7tgGid3h9IlncPIP8hOt+q6agiOMBgeG96AAojZaKcEA70U5/g?=
 =?us-ascii?Q?l3q8wekIR99074sBdZZIA5P0dRolmaIRpezygvyUjZB/EG135smHeHTUkDj9?=
 =?us-ascii?Q?Df6Y8BAsUTE/ZPajY7BrrR0JVjo42bHePMFLqCmHL9uXeTA9ayQyrJMtKO8h?=
 =?us-ascii?Q?Adm+zI4AJVD8tcwyEdJ24ROQfLXR49P3eyLkNT6lROrqXjE2XRgOfLtezKvF?=
 =?us-ascii?Q?/avX2ak4MuDjDEWvltbi5vGbJGQYsTrGiydrj6SJerqovPrBqvyNd9eQG5F0?=
 =?us-ascii?Q?aBtwzRHVqOEdzRLqGcLMEAVZZWkapXcAAvmX8Uwo8KwzJJdvhYnNVocB0bIx?=
 =?us-ascii?Q?KjvH9jl7inYQkhR/WEFeoVzmQszHcv2gW2nKAgFfeKxxmpN6kEWCcKbI2b0j?=
 =?us-ascii?Q?74PeBtyQt7J0+qxglyFZOizRG+zABKMypOS1YA5r?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QV2A1CJ4puogJFEZVdlwKnJ3GSspvpO6jPtU+nmkodXHfBMZuI2sdYWz2/Mb3jwEecqe353Dgx7dtd/HgjBvCX2EtQZD9UMJ3+1r7MHsVMv93LwHD7SIFeEGWKXrK8qptlRlj5mXSuM9m9djjAff6oo909d5MubFWkd7HqPoIvubhhzBx9LGXnSQYdaF5VWB6G4k524IerAi3PLy5QQ3qRZqNGsqss3oLn4pHcMhhOZ4dtMu0rbdRNeiYu6yJZQ7yDyUKmXnvikPbVHtoZtotqOekZLUlzCfIGx8FQ4awy6wvvVaREWS4SFRe2gC1Ao2haYU9RE/Di/YcST7SE8P/DWzc6kvA9OmkPHSLEj8DyRgwuv6yDfgK4CYLedV7mFQbLaU/jFy0GFA8mI5hJVho1YAUsAaLuCcf0KGyeFRuCBDrhFUmwOzMuPlzh09E0JV+NDqYb00poj0TvhS2FrJ6xbyPRvIZRz20XtYc7gb1VbScjJBqT43b+icz43E7EC7hXAD91QUTsBlF46KyyXa5Pm/DHTZI4d1ywzsTUciizIZJDtYx1fxiA95XMhhxbveted5KXUcD7QBQjpaKRHTYhZTGRO7Z34f7FvgHyFRfTQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49792491-5eba-4917-53fe-08dce43047dd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:51:59.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaoqT/l1uUqEBqOyLAgVAZjLayHpi0r5cOzXqG/g7a1WFGFbAGbsizyxjCyN1jc6kbfgEj/I53Nnk0umV6lrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4464
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040032
X-Proofpoint-GUID: mdbF2_uL09xA6d8EwKPf4RZEoFUlzwyG
X-Proofpoint-ORIG-GUID: mdbF2_uL09xA6d8EwKPf4RZEoFUlzwyG

From: Eugene Loh <eugene.loh@oracle.com>

This checks that pid entry, pid return, pid offset, USDT, and USDT
is-enabled probes can all coexist.  Specifically, pid offset probes
can sit on the same PCs as pid entry, USDT, and USDT is-enabled
probes.

Note that PCs for pid return probes are apparently in the caller
function.  I guess that's due to using uretprobe.  I'm not convinced
yet that that isn't a bug.  It isn't what Solaris did.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.r  |   1 +
 test/unittest/usdt/tst.pidprobes.sh | 292 ++++++++++++++++++++++++++++
 2 files changed, 293 insertions(+)
 create mode 100644 test/unittest/usdt/tst.pidprobes.r
 create mode 100755 test/unittest/usdt/tst.pidprobes.sh

diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/tst.pidprobes.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.pidprobes.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
new file mode 100755
index 000000000..8d18c89a4
--- /dev/null
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -0,0 +1,292 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes can share underlying probes.
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create test source files.
+
+cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int, char, int, int);
+};
+EOF
+
+cat > main.c <<EOF
+#include <stdio.h>
+#include "prov.h"
+
+void foo() {
+	int n = 0;
+
+	PYRAMID_ENTRY(2, 'a', 16, 128);
+	if (PYRAMID_ENTRY_ENABLED())
+		n += 2;
+	PYRAMID_ENTRY(4, 'b', 32, 256);
+	if (PYRAMID_ENTRY_ENABLED())
+		n += 8;
+	printf("my result: %d\n", n);
+}
+
+int
+main(int argc, char **argv)
+{
+	foo();
+}
+EOF
+
+# Build the test program.
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+if [[ `uname -m` = "aarch64" ]]; then
+	objdump -d main.o > disasm_foo.txt.before
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Check that the program output is 0 when the USDT probe is not enabled.
+# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
+
+./main > main.out
+echo "my result: 0" > main.out.expected
+if ! diff -q main.out main.out.expected > /dev/null; then
+	echo '"my result"' looks wrong when not using DTrace
+	echo === got ===
+	cat main.out
+	echo === expected ===
+	cat main.out.expected
+	exit 1
+fi
+
+# Run dtrace.
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+p*d$target::foo:
+{
+	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
+}' > main.out2
+if [ $? -ne 0 ]; then
+	echo "failed to run dtrace" >&2
+	cat main.out2
+	cat dtrace.out
+	exit 1
+fi
+echo "my result: 10" > main.out2.expected
+if ! diff -q main.out2 main.out2.expected > /dev/null; then
+	echo '"my result"' looks wrong when using DTrace
+	echo === got ===
+	cat main.out2
+	echo === expected ===
+	cat main.out2.expected
+	exit 1
+fi
+
+# Check that the program output is 10 when the USDT probe is enabled.
+# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
+
+echo "my result: 10" > main.out2.expected
+
+if ! diff -q main.out2 main.out2.expected > /dev/null; then
+	echo '"my result"' looks wrong
+	echo === got ===
+	cat main.out2
+	echo === expected ===
+	cat main.out2.expected
+	exit 1
+fi
+
+# Get the reported pid.
+
+if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
+	echo no unique pid
+	cat dtrace.out
+	exit 1
+fi
+pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
+
+# Disassemble foo().
+
+objdump -d main | awk '
+BEGIN { use = 0 }             # start by not printing lines
+use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
+use == 1 { print }            # print lines
+/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
+' > disasm_foo.txt
+
+# From the disassembly, get the PCs for foo()'s instructions.
+
+pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
+pc0=`echo $pcs | awk '{print $1}'`
+
+# From the disassembly, get the PCs for USDT probes.
+# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
+# what sequence of instructions signal a USDT probe.
+
+if [[ `uname -m` = "x86_64" ]]; then
+
+	# It is the first of five nop instructions in a row.
+	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
+	# as well as whether they are nop.
+
+	usdt_pcs_all=`awk '
+	BEGIN {
+		pc6 = -1; is_nop6 = 0;
+		pc5 = -1; is_nop5 = 0;
+		pc4 = -1; is_nop4 = 0;
+		pc3 = -1; is_nop3 = 0;
+		pc2 = -1; is_nop2 = 0;
+		pc1 = -1; is_nop1 = 0;
+	}
+	{
+		# pc0 is current instruction
+		pc0 = strtonum("0x"$1);
+
+		# decide whether it is a nop
+		is_nop0 = 0;
+		if (NF == 3 &&
+		    $2 == "90" &&
+		    $3 == "nop")
+			is_nop0 = 1;
+
+		# report if pc[-5] is a USDT instruction
+		if (is_nop6 == 0 &&
+		    is_nop5 == 1 &&
+		    is_nop4 == 1 &&
+		    is_nop3 == 1 &&
+		    is_nop2 == 1 &&
+		    is_nop1 == 1 &&
+		    is_nop0 == 0)
+			print pc5;
+
+		# prepare advance to next instruction
+		pc6 = pc5;  is_nop6 = is_nop5;
+		pc5 = pc4;  is_nop5 = is_nop4;
+		pc4 = pc3;  is_nop4 = is_nop3;
+		pc3 = pc2;  is_nop3 = is_nop2;
+		pc2 = pc1;  is_nop2 = is_nop1;
+		pc1 = pc0;  is_nop1 = is_nop0;
+	}' disasm_foo.txt`
+
+	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
+	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
+		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
+		cat disasm_foo.txt
+		exit 1
+	fi
+
+	# Separate them into regular and is-enabled PCs.
+	# We assume they alternate.
+	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
+	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
+
+elif [[ `uname -m` = "aarch64" ]]; then
+
+	# The initial compilation of foo() makes it obvious where the
+	# USDT probes are.  We just have to add the function offset in.
+	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
+	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
+
+	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
+	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
+	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
+		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
+		cat disasm_foo.txt.before
+		exit 1
+	fi
+
+else
+	echo ERROR unrecognized machine hardware name
+	exit 1
+fi
+
+# We expect all of the USDT probe PCs to be among the PCs in objdump output.
+
+for pc in $usdt_pcs $usdt_pcs_isenabled; do
+	if echo $pcs | grep -q -vw $pc ; then
+		echo ERROR: cannot find USDT PC $pc in $pcs
+		exit 1
+	fi
+done
+
+# Get the PC for the pid return probe.  (Just keep it in hex.)
+
+pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
+
+objdump -d main | awk '
+/^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
+/^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
+' > return_func.out
+
+echo "<main>:" > return_func.out.expected    # since we use uretprobe for pid return probes, the PC will be in the caller
+
+if ! diff -q return_func.out return_func.out.expected > /dev/null; then
+	echo ERROR: return PC looks to be in the wrong function
+	echo === got ===
+	cat return_func.out
+	echo === expected ===
+	cat return_func.out.expected
+	exit 1
+fi
+
+# Build up a list of expected dtrace output:
+# - a blank line
+# - pid entry
+# - pid return
+# - pid offset
+# - two USDT probes (ignore is-enabled probes)
+
+echo > dtrace.out.expected
+printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
+echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
+for pc in $pcs; do
+	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
+done
+echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
+echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
+
+# Sort and check.
+
+sort dtrace.out          > dtrace.out.sorted
+sort dtrace.out.expected > dtrace.out.expected.sorted
+
+if ! diff -q dtrace.out.sorted dtrace.out.expected.sorted ; then
+	echo ERROR: dtrace output looks wrong
+	echo === got ===
+	cat dtrace.out.sorted
+	echo === expected ===
+	cat dtrace.out.expected.sorted
+	echo === diff ===
+	diff dtrace.out.sorted dtrace.out.expected.sorted
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

