Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AA19CC05
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415176; cv=fail; b=s97UVrfAzPjFIwjWUVq25X4wgqktwOJzcezJrICD30Ko5sT81CTdaLJ6rXmkMPrghVv/t3/KECp59SNZrgxtKp0Ob4MhpkhfC+Uw069txdbwzr8WFhMm1cnYc611X/0exKHCERlGu+L1woJ7NVhHmt7yhp+dNLXx5BzY4ZNYACA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415176; c=relaxed/simple;
	bh=cP82ELki4nxn1v4DOrlxjxoxZV7EnX3/QaliMnX4adE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pnrwaz4sf6DZS+s1P9FAmmrLZL/tcLlG2nZ8vIJ/HRfKr/K7u72SID6Z+aXfDQ4yTU/bpHt/z/9y7Vgl38cWYsz8bjLkeLdIWI19YL1MrCJzQYFkyGrXHUwpqlADjTVuEtNEfUsqKM36LZ18An89p5CmGKmHeieGkCTd4tgaWAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nB5c+kVq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vjo/deBq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nB5c+kVq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vjo/deBq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VKrNQh027223
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 22:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Mbj6gbQV758qJXmC2hKCQpWinomH5+A9LJJlyZOA4nA=; b=
	nB5c+kVqMe4GfFOmLJblS+ttXCOsy7pjtrNG7TNOSTnA8cej/nKijfCUzVoFWK1W
	JvrQkThTa8ibiBMjmHB3WYFxbD/E9T8RUbF/0Dd1eTRfESCLA2yvwcSRDPwbJUA3
	6BnB/JuZlQCnJIyns4FJPN9m2ujtYp+Ln1q4hYI4tKRyuziisnh6LgtYUUot5aqH
	24lHzOe3tWztWQEwrz8BUl2aTiVZHZl8/V+pHATcQhAXHmFlQSLr7kbqjlSKUDxp
	39iKfoeoaWZL4K4mklGaaloh+sgLuubJ5I2UTY3RF0R1xcBGH9tkevOCCYT6H7+O
	1suLF84OvhJ8rrAyvtaqrg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmkg4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 22:52:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49VLheIm040315
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 22:52:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnascecx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 22:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nevn8xKwe7r6/J4apMBiec4mBVXRp4ZJBqncjEjH3HI6OJ/sO+DtwQBhlqNECh53k6ChjiGk2YZp8J4ZVH8+1SPUhLZ6NzuDDzZJhuu1rDs/6aKdm1USFTDLm0IB6m+81CUESAbI1+YI55qb9Ol9jPBdGDu9tNwIrvf474QriC5uwVcu1ujowm4MYkUF/MxRXRamwzN9L0REH+J4zSUoiSck4gY8PtAdTZHerhIU9Aq6zlYg6nQky0B4xt/TKp64pOBXy9WdBIaPMh+uV9bbJwAXPTz13oJWYyTWx0vRhzbgqV6oS0fpomZUMwSGn/gNTeYZrVZP1xhVf/YuVnfI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mbj6gbQV758qJXmC2hKCQpWinomH5+A9LJJlyZOA4nA=;
 b=rI73AQjE/qQ3h9AOcQIT6Clhk9XtUXicBnsjsSHxLt+wPJjDdkHEG/AsIREJZlm7ADN4oj+mNdGQv/Ju0OcNUj1xW3v8KXsdhZxCwzwuTsTyyIMzq/pd9ggBRobYPgB7YSqO2PwRKHPuoYOZlu8sqEhSsEzGsCPKUep/7aBg6NviY8lmQzX0ucBK2xdozx46V3mpr2/HIssYmZsMifZyGrikLjzGR1ijIvd3JGxWF5zWZb8xg9N3plyECw47KcNQF/6+e6Q8BVba9JadVfwodrl8bkOrUYjHUMc1V5zmXvqcyKhAwwaXBfNhgiwIWxAGonTyCBxPifh6rASwFhvxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbj6gbQV758qJXmC2hKCQpWinomH5+A9LJJlyZOA4nA=;
 b=Vjo/deBqeZ4DLdmOccLSq3qY6TZoP0lJhfmCGVnHngmNPbuwBpMXTvI/PLP8FhmmFdwKF1t3Th/rLSF9dj9nn5wyv+bUKc4BvmRNxBq54FTd3ui4RQdknkzAVNdSZMBSpIV+PAEXAYNQX89P3c0OR/+uyYfPcTd2ya0DASQJfIs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5876.namprd10.prod.outlook.com (2603:10b6:303:190::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 22:52:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 22:52:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: stack_fbt
Date: Thu, 31 Oct 2024 18:52:39 -0400
Message-Id: <20241031225239.23661-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2545eb-6297-4d72-0ecc-08dcf9febb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zHGeFC55/RzJXltsVzTuNYxA495uEgf1wTqoPaWedZFQ5EV6NpTpccckWs0M?=
 =?us-ascii?Q?P/aQ0rUXOPJ1nLrMMoo9ik/ur8itT9swuU9HYtTd0lGupyBd0OCRgiuRkImW?=
 =?us-ascii?Q?Ymp6JxTC+ac6DbGSjRa7BJFCSoyerWnCBDNFGSrXVHYV8RwKktkUF8N/ja8S?=
 =?us-ascii?Q?V9cnuuT0s9xbukk28hUVCPe8SnEoTfb01pqCz3jdGWCwosn8MCCUaWmypU5C?=
 =?us-ascii?Q?QWBPlxY4Flb3TDZzLslRcKIcoPF+3ViKNCKQ8WJAW61GXr8iRI4l11B8Qyb0?=
 =?us-ascii?Q?x2INLKzo9AamfGGLm35w9lF/q2+9UA8qh55dO0bCaZsgo2Hy2LsK19fTnkVt?=
 =?us-ascii?Q?cZ+yPyLvMPVweSyaVsYSyBiEaKIm1MWNN8NvodW+j1BLiPY3hI4K2/kAMlwX?=
 =?us-ascii?Q?ZK2Jniz4+uEHi0UUEjEx1Mba9K/FlGpoRJwV1LwQLTvi6f0WMkaRgzxaA8ec?=
 =?us-ascii?Q?3HTlLI/4LO/ZkAqnUhdAt03D0W9Ov6glVNu9fLMMeLTIZdA4Pc0fMX5zYeG3?=
 =?us-ascii?Q?QJ6lvfAFF4yq4sjSOMJSmryzONBLK6zj6Qz6gxcCMgSPbq4bi6YQo5OIeS94?=
 =?us-ascii?Q?PdaXdTTClgIBt8EpDC6r3YV1/Be/tw9/Xt0Pm3eNAOe92fOayvmcIvllXLjE?=
 =?us-ascii?Q?qHAMxYy/K8OB/d7SCv1Dcjvk7yFNvhoBFwPjJQpv+iNOdaAuTpsXhRsQTFCB?=
 =?us-ascii?Q?N98KY6e1Nj1EypRABjk5cBmy6KW33O2iknz2WD9H4KKtFf95yi55pGbBjHVi?=
 =?us-ascii?Q?TK+0i+mO7+rHZF5RrSzBPi+kAH3VVLhIwmUolM2uODRmJJdT/vXf5prL1MiG?=
 =?us-ascii?Q?vj4mVrlTj9UpI7B8Y2d5vY1ZlJooCWK8/uzmjfslVLB+VDxFr60Qx1VGI8lR?=
 =?us-ascii?Q?wyr9u4ch9lTQsgByYvXubGMiyods7llcwCc56MOkmjVfQ9s2UTKksxRBlqic?=
 =?us-ascii?Q?f1J2JqQ/WrUxkAQtfvf8a7li5ZtuVee3OEm+3aZkmjV2X65y9siw+OpyjwNd?=
 =?us-ascii?Q?fc6S545afQEadlwWCsZ89PnrE3Ma4aPJfaPGkAuTqSUjCtfuIyQsB3wMm4lq?=
 =?us-ascii?Q?vKQ3qr/bc+Ta0914H7tlmvRM1O4JbH6B7KuAmV9QoCVvHlEXmXVs1oqsdGNK?=
 =?us-ascii?Q?nK5Yp/67RpWlTUh9NwHHlPtSK8RPrjabDlKg39Jo+7D/UBDTtt81jsAAG2ju?=
 =?us-ascii?Q?VoIrlsptXfik0KPsnmo5uxRGmV6HJCo1fMsETs4HU4dgmb3FGkTKLxEMM3hL?=
 =?us-ascii?Q?YEumugLvjLwG+qdM+kMd1X3tattjbjCr2YI80cop4je22KWaTqMstzYFgTti?=
 =?us-ascii?Q?bTqDcHJqPfXIHzNA0OvcfC69?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PAKFEOw+u+21+yiRhvs8+7kktNeT9BOd7Qj0Yje5f+PCSHNPO9nzIM1LmwZH?=
 =?us-ascii?Q?TqL3TmL4cjiAt+6EHdMrIOta4U4LpT6rDL8VQHAIxYOLVY0hatlnsU377/Qa?=
 =?us-ascii?Q?OnZbO82exFcXfZ+FCCC9EWYTyVmB/NAF7iWF5AudbGCir9+anqfL0PjGe0un?=
 =?us-ascii?Q?5upXw1tDLE3M3FcurzbV1oR9U18g4PPIVfjvxnesxxelJY6L3mIy1DeRnPBC?=
 =?us-ascii?Q?BQuFJyL4kLgPP9JBrKpjMBaIL7fC2JOOp7QDvcDWPT/lGXdCBFpKAqx2+Ot0?=
 =?us-ascii?Q?mo0PWaQ6l0qQ0M9gi2lcJm0kl7aEkv117FPotuR0qwT08eFfi3OU8py+N+gT?=
 =?us-ascii?Q?uH+lyIn6ffSj9eDVcndZXSGrCxgyLDcp+/tj+dAm/uLKMl/ONJTewesECq8Q?=
 =?us-ascii?Q?zrLljfzCdS+Knh530yLhxbaxRUhVlUmeykQ18Gko+3gj/fvUjT9P6Ap/SrLT?=
 =?us-ascii?Q?bVVh0KmlPoFiQz2OdeWNpCNP1Q1uFa8agc7uMoYCSSPUlpJj0DOVV9d/6P1O?=
 =?us-ascii?Q?6gzEUVq+ZyYb8nKDJteC24qzvRxMv1TUhREhUXTQt9JHQZimvebcwNFUZe8n?=
 =?us-ascii?Q?mE+emm19eiSKSw7XP+8voezlnBVJDOHQiNKNsQwdOEB2DBGq6OY9vyP4ONJV?=
 =?us-ascii?Q?obiHTvSNcj4Ae6RSw3u2tzzO1XFah+CzC/f4vEZhs4+XQVcsCln9LMJpJcl7?=
 =?us-ascii?Q?18GvG13N2l5C5YQKWmZ4xBClt0wSdsP2WFBvyuIf9IQeRI+a54ixbaVsUGHF?=
 =?us-ascii?Q?4NTGIENXflr13uoiY1dNJNns/3yUsowwanMN7W9N2dBUVLaL4b0Bhn9ZsCRY?=
 =?us-ascii?Q?2U9w3hQpobnuPYrnvieWeQnSGcZyRA7Mo8bTIilTygmUiwZyzhwODDVxrb0F?=
 =?us-ascii?Q?8u6UTlI35c2UOfOCXqsadSi3XKjn8fFNJDbgqdOW8dE6Rmc5FsO6ksMLgJI4?=
 =?us-ascii?Q?FIcvgUwCWsKtXmNLVw3qz6hZk295iSs7c4Ssu+wUQgG9vc6ZXeEh1Lq+5uYw?=
 =?us-ascii?Q?gR90IJK7vnuhdzPDVxYXsDn9WjnCb+BqlKtNBKTRs+ufnW8Tm3GRrgydXK3S?=
 =?us-ascii?Q?ktrSDcfQ0m/FjvIh2m+eTrQrUHqBhSTQUtm7qPIlCHqdhJu9JU0zHEux8O0I?=
 =?us-ascii?Q?Fi7Qj/o6dgcxPaeWj4xpvc9pytWtHl8cGSkPdsPSUTsRR4awv8Z5KE3Bd38B?=
 =?us-ascii?Q?KdBtpFYwFipSMPbQ8I0Fu4Iqrg88chHPMJBaOUHeFus5Ks/gxQnE/tk066zN?=
 =?us-ascii?Q?HuQj/XNefWMp2pgjR9s1tDhnmT9J9HDLrp+U9cJHyex9HRbtooPsta66HX4K?=
 =?us-ascii?Q?0yoeWv056x/DScEatW6A+jCOlFeZ85GfrF1UKT01DXCP+Ru74aXX473CM439?=
 =?us-ascii?Q?0XskrgWlPtfoGInHFmWJWVNRgmgVs9w8ayoL+Tnou7RCO04neRE73JjZDP4p?=
 =?us-ascii?Q?c+3OGMlw10SnU5M15AFpRgeQ4JlVji6MB2O+ttoaLpxT2NrPJQk9t43ynj+e?=
 =?us-ascii?Q?AvQuplEYrh9NOqTvr7IG29vz6tt7+PAi2+EH5HlpR73GqtyBjF5S1jg8OqO9?=
 =?us-ascii?Q?+mTZXVgobnKH4/xBPICSMg00FQ7qzdiZCFEwHmCl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DU3D6uVKm7QD0hNrinySL5iVypwoYqitBi4LuqK0N9+TiNEHpdXphygalZQoMDXmO0KNAbFRi2FwwhOm54Au9mij6LfFf4AW2VmRrmmlqQNFcfu45jpITH0X8PaWRjwf+LHj58fDslHugPAONxQ6+6AFIE+Ce/oYe4q2FtDcsdHgOu+tR0sqKGapO7TDw3VfSOmvUe5P/uDSs0gIiSdj7TlsDdNkIjivAYR/SBWwWJkWU3lKmvYRYTwxXsTuU4mZ/As3zXrXNutIQ2MlcJx8Dvf+mqB79qIjjGDV4IifJqDfeEhKKJ5gzNG62qwTIn44YBYAMJ8Wt8n1gYjctSRghfzvlY28GEHK1kICq3HUvbLitBVQTTwsbgGkL149zTVZA/6vLwa8JJhbtNQ5H9wawsuG5dtGfEWDCHpoRUWmkC0ZP8hjn4O7BXm+oJS8di+8VVGbvN01h9ZH7ZhB9rX86H2qGqQWSnZzgH++5fmRxz7is3JArSb9UKsxOF2cJdfuwsVQP+wm8qS4HG4Wn/POmH5ndCkSYVfpeYa/mRHT/kPkOiTADe/pIrT2fS/iDFKIndxy+ZEDccobuf5P5KZY1/Ozs4Of8MPnNXuPrsAx2Yw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2545eb-6297-4d72-0ecc-08dcf9febb5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 22:52:44.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utbQhriwVrWmjtK+KfC/0ncJod47Xo9F9zmvQ3rBxeYN24dKcGaIT2+28QPC4XYY4Q6noYP8AjvhMlG+P2q2Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_12,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310172
X-Proofpoint-GUID: nfnRmdZWs3XPev8jNxh-xE6ooTY8oFsY
X-Proofpoint-ORIG-GUID: nfnRmdZWs3XPev8jNxh-xE6ooTY8oFsY

From: Eugene Loh <eugene.loh@oracle.com>

The test was being skipped on UEKR7 systems because __vfs_write
was no longer traceable.  The expected stack on UEKR6 x86_64 was
out of date.

Switch to fbt::vfs_write:entry.  Convert to a .sh test, so that
different stacks can be expected depending both on machine type
and release number.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/stack/tst.stack_fbt.aarch64.r |  14 ---
 test/unittest/stack/tst.stack_fbt.d         |  25 ----
 test/unittest/stack/tst.stack_fbt.sh        | 123 ++++++++++++++++++++
 test/unittest/stack/tst.stack_fbt.x         |  10 --
 test/unittest/stack/tst.stack_fbt.x86_64.r  |  13 ---
 5 files changed, 123 insertions(+), 62 deletions(-)
 delete mode 100644 test/unittest/stack/tst.stack_fbt.aarch64.r
 delete mode 100644 test/unittest/stack/tst.stack_fbt.d
 create mode 100755 test/unittest/stack/tst.stack_fbt.sh
 delete mode 100755 test/unittest/stack/tst.stack_fbt.x
 delete mode 100644 test/unittest/stack/tst.stack_fbt.x86_64.r

diff --git a/test/unittest/stack/tst.stack_fbt.aarch64.r b/test/unittest/stack/tst.stack_fbt.aarch64.r
deleted file mode 100644
index 3a2896c48..000000000
--- a/test/unittest/stack/tst.stack_fbt.aarch64.r
+++ /dev/null
@@ -1,14 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__arm64_sys_write+{ptr}
-              vmlinux`el0_svc_common+{ptr}
-              vmlinux`el0_svc_handler+{ptr}
-              vmlinux`el0_svc+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
diff --git a/test/unittest/stack/tst.stack_fbt.d b/test/unittest/stack/tst.stack_fbt.d
deleted file mode 100644
index 27db21164..000000000
--- a/test/unittest/stack/tst.stack_fbt.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Test the stack action with the default stack depth.
- *
- * SECTION: Output Formatting/printf()
- */
-
-#pragma D option destructive
-
-BEGIN
-{
-	system("echo write something > /dev/null");
-}
-
-fbt::__vfs_write:entry
-{
-	stack();
-	exit(0);
-}
diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
new file mode 100755
index 000000000..f70980a48
--- /dev/null
+++ b/test/unittest/stack/tst.stack_fbt.sh
@@ -0,0 +1,123 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies the nusdtprobes option.
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/stack_fbt.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Use DTrace to capture stack() at vfs_write:entry.
+
+$dtrace $dt_flags $nusdt -wqn '
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::vfs_write:entry
+{
+	stack();
+	exit(0);
+}' >& dtrace.out
+
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace failed
+	cat dtrace.out
+	exit 1
+fi
+
+# Strip out pointer values.
+
+sed 's/+0x[0-9a-f]*$/+{ptr}/' dtrace.out > dtrace.post
+
+if [ $? -ne 0 ]; then
+	echo ERROR: awk failed
+	cat dtrace.out
+	exit 1
+fi
+
+# Figure out what stack to expect.
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
+	# up to 5.8
+	KERVER="A"
+else
+	# starting at 5.8
+	KERVER="B"
+fi
+
+if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
+cat << EOF > dtrace.cmp
+
+              vmlinux\`vfs_write+{ptr}
+              vmlinux\`__x64_sys_write+{ptr}
+              vmlinux\`x64_sys_call+{ptr}
+              vmlinux\`do_syscall_64+{ptr}
+              vmlinux\`entry_SYSCALL_64+{ptr}
+
+EOF
+elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
+cat << EOF > dtrace.cmp
+
+              vmlinux\`vfs_write
+              vmlinux\`__arm64_sys_write+{ptr}
+              vmlinux\`el0_svc_common+{ptr}
+              vmlinux\`el0_svc_handler+{ptr}
+              vmlinux\`el0_svc+{ptr}
+
+EOF
+elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
+cat << EOF > dtrace.cmp
+
+              vmlinux\`vfs_write+{ptr}
+              vmlinux\`ksys_write+{ptr}
+              vmlinux\`do_syscall_64+{ptr}
+              vmlinux\`entry_SYSCALL_64+{ptr}
+
+EOF
+elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
+cat << EOF > dtrace.cmp
+
+              vmlinux\`vfs_write
+              vmlinux\`__arm64_sys_write+{ptr}
+              vmlinux\`invoke_syscall+{ptr}
+              vmlinux\`el0_svc_common+{ptr}
+              vmlinux\`do_el0_svc+{ptr}
+              vmlinux\`el0_svc+{ptr}
+              vmlinux\`el0t_64_sync_handler+{ptr}
+              vmlinux\`el0t_64_sync+{ptr}
+
+EOF
+else
+	echo ERROR: unrecognized platform
+	uname -r
+	uname -m
+	exit 1
+fi
+
+# Compare results.
+
+if ! diff -q dtrace.cmp dtrace.post; then
+	echo ERROR: results do not match
+	diff dtrace.cmp dtrace.post
+	echo "==== expect"
+	cat dtrace.cmp
+	echo "==== actual"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+
+exit 0
diff --git a/test/unittest/stack/tst.stack_fbt.x b/test/unittest/stack/tst.stack_fbt.x
deleted file mode 100755
index 4561df8bb..000000000
--- a/test/unittest/stack/tst.stack_fbt.x
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/bash
-
-read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
-
-if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
-	exit 0
-else
-	echo "Function __vfs_write no longer exists starting in 5.8"
-	exit 2
-fi
diff --git a/test/unittest/stack/tst.stack_fbt.x86_64.r b/test/unittest/stack/tst.stack_fbt.x86_64.r
deleted file mode 100644
index 792ce80ad..000000000
--- a/test/unittest/stack/tst.stack_fbt.x86_64.r
+++ /dev/null
@@ -1,13 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write+{ptr}
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__x64_sys_write+{ptr}
-              vmlinux`do_syscall_64+{ptr}
-              vmlinux`entry_SYSCALL_64+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
-- 
2.43.5

