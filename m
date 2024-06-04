Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D8E179BC
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524707; cv=fail; b=sv+YmIVM4j0sMyhLQZW360Fn+7/ekal6ToGgaLHRr41oONt5IRaYAoKk/OyVXEXzgavK+JUwx/Atg57Mbj+8cuNSSadUSHec8D/46qg56QWpFEZKLrkosamVZ9qQS2r6f+3H7axfzxcJXcswMqotmRFZevmn6NXvU988NHS1xpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524707; c=relaxed/simple;
	bh=kg7hmSKOwBzbGD+RkWB1QqdFaBDy5t3veuE23AZRDj8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TMHGMxNlUjRIEWwQ8guYydjDN9gi5pL+rfKgXv5PG+Se5vuTChIJdR/lK3ccY4SA4bnt8BDmYlI69S0dYjIzbmEWD67wzTrnn7pWWKFkzhHIK+w8mF4FS7fSulcSKoi1ivO+TKF04iiKpe53QWGYUnPY1puCf8W8KhzPh8S0gjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnW7t032110
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:46 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3D7iSf690U6K2S8ho?=
 =?UTF-8?Q?hjwNEZa9UhmDG7/ZZy6AdEzsM9jQ=3D;_b=3DWWf1XnGQlrH3PGfmEgnYmBTQjl?=
 =?UTF-8?Q?c7/YI9KiDy1se1abcysZ6ygsu+ZHclwEm59V1hhTkc_JUhmgEQhEcEWCjqBDJwG?=
 =?UTF-8?Q?pdN+efZuHhV25/6GJJpMotU75sZZgEjVENuJAAVBj41Ddxh1_1CZNpB+hqgiYjh?=
 =?UTF-8?Q?9Sxi1/9QCPDOm57Cl9tWP8Ph0PLgfhl3ScLRW+hkZDmpreoiwLi9Xy_fKYuB0Xl?=
 =?UTF-8?Q?UQ5k/LuU/09PEhM+BgwwlIPH7YPKhQ0fbZINTI483VHYiWLtFeF9tRjdHwIw_zI?=
 =?UTF-8?Q?vBNkjTb4+/ys8rMHjd0scUfeW1Z5JB1xEfdp5gZSdYV6adc4pnUSRJcQ2nNZTXJ?=
 =?UTF-8?Q?7nV_0w=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5md3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:45 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HdTQA025198
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrt8yy4d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiqIqsMnk2GHY6nyWX69HvYvaAqpNTwPndzi3LVoIiurIAgyx2GTJBYX2ot5CUFACkqN5UxKxv4VkNVD/UFWJVeZSfx4kihaBf6rtA6xQlwHtIA8AwGNvk/pSBjM13SQnr2tZmdkTxZ9DrDfGjowx+Bj5eEBCP7TIyMkAT2Vj02bo1Cn/gLQiuL7Ge46evLoR8DcukJUCUshj485eYB84rbwSi9KhkUrgCJLWsZupBE4aXHnm4RxxiXIQtzk6hDxtafDH2b7lacnz3vKqNQVb0mbiYPR9tmqmt0/SRIjjRuugBuC5RgIwDQOiCg++t9po5SV0BZ3eTnt38QSFFs4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iSf690U6K2S8hohjwNEZa9UhmDG7/ZZy6AdEzsM9jQ=;
 b=IhZ2fu9LIrdTF4Jqb3FfsjKzR34xrc+3bmSzDsTozu0z5o3AfIKWJZ1eAi/Swre0ClJMQUs29i/p2zasTq7rjr7uAW7AwipsN2Kpx+kNlzdcYDJAwk9QJlejHekVccpV8Q0IEozEg0hy2VxfkqX8sf5hJ2JnymwntHVKlB7Owwy6TWeO8jmyp5hnF3QtJrtTmZIv78jDWMikKSl248W0en7R+WSbf6SE2XtG30QI/AnhFsY2ezKeHH4CAggNcGMsbjKomZsRjN2RO2lT6+ZHupfLei6gL69UyT+Ku6Wp0PlQCez9je5dBBEdDMaIu59hUohhaSjQwm0vxinDtLlmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iSf690U6K2S8hohjwNEZa9UhmDG7/ZZy6AdEzsM9jQ=;
 b=PZW42iFZOFv89xn+sgfzFPGJ6x2B+oUTBpCorHkdVceuQ5cPCG4IPp37c8yEjTvx2iJtzYvOLr6iFlIZXdhati0GLYFirMp5owZ589eb/N1BIJj3OS0U9NDDHiJ7UXCWkA8dOJi8ByJkDqTKaC1WAU4Vds17qU1YQP+dNEJ5lTE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/14] Add a hook for a provider-specific "update" function
Date: Tue,  4 Jun 2024 14:11:04 -0400
Message-Id: <20240604181113.11505-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0142.namprd02.prod.outlook.com
 (2603:10b6:208:35::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: f91bfcb2-e2d0-4543-e05f-08dc84c1c8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W9uZaTAtmYxeTh2xj4G1LlOcc3T98Rlfcs99u8CvReHFea9pzckLKwGtX9vH?=
 =?us-ascii?Q?7O06K3qfMlOwGQetmK1qQiNiWsqiU7yX6lkIkGn5nqS4Yn+YrmHOYjeRuig9?=
 =?us-ascii?Q?fx6vAxjBqC0grlYz+CFVIK1zBydoA55YFOGRQQ3eafspsFqSpc0WEaDOL/gM?=
 =?us-ascii?Q?1zbv7WTLpCGWbuZXtpI5co92c8Ov49hMDB8+/ufcyJDsERreLk3rAuHjK9vg?=
 =?us-ascii?Q?etzclAU9X5HjXxsahOkzB57jL0KUtb80TGEkppnUhItAwhozZpwLCTfCSfA9?=
 =?us-ascii?Q?CXJyAqTWkf2UK9y6PjvShuVDWOec9TjhLzp8oTVLGUiLM915kBUSBk4poYzN?=
 =?us-ascii?Q?OgcfIdA+0s7zuLk3kGEzfHQC/BjDbYPgPeo4MEIEffVGy+6FL30gq/Q+zupf?=
 =?us-ascii?Q?ZMQa988x5Z9LRK7YyeWSVK+GfhuUAF+d5PRW4Ii6NhZsh1TDu9SHONNjh2pc?=
 =?us-ascii?Q?onDtfaUGzSzCV9a9NlIKKsvwI4ZL6G6K0qv2AN2JcbXvVg7+fK5SRJg5pWv5?=
 =?us-ascii?Q?4WqxlFToAJtrl1bHDUq7DuwsxqnHgQ1Z+xsU6U8NsbkP8NM4MsEFRsFtmBsM?=
 =?us-ascii?Q?0i8kwPdmjD/x9ucnqZJuRScLTMTe2vaWKhhavvTZyYuGNTJ6SGm89nM9ibgk?=
 =?us-ascii?Q?/hDCaalNPVgBdfAlOw4+414IuQn+uprKDPcfnuXa8cqpdSavS6E4XnfMrGrQ?=
 =?us-ascii?Q?hypc8FmG4V6F9iST1XzFFibvFKy9ctfsWIk81gwc671cE3EawTqHDWlIEY8Z?=
 =?us-ascii?Q?GCufOub4Chmcz/c1mLNufgVu9NXYkl7eKn9x4iCg+AAxUuDo8vhwTHb738d0?=
 =?us-ascii?Q?U674gp6TlmOcoY5RmKsu8f8wNixd5KvAknmry27g200bFwn/AfYfv365EkRq?=
 =?us-ascii?Q?GFta1s/ClF0K5fFWBivZqvF1p0S4iwx4qXgIlTwactlraGB1lkBxdDvbuKBF?=
 =?us-ascii?Q?3bmMgzIrSzpOhu6cGhil2frL2Jt5vurxrRlwlb1Y8MTtxzIgYEF+2pXPyjqV?=
 =?us-ascii?Q?VXTsid/EFGWG0xg8g0AzSDEnOeEgolBvajFoe+x22TbVHq9Kb9y20/resYUS?=
 =?us-ascii?Q?YPCFw8HuE8I+v2yAXgXVi1IJOXEjMq0HXPw+QNXmjWZZ9Avhdyo0hoS7wozq?=
 =?us-ascii?Q?NtMoNlJwZAlXl8TlVejbgxjSn0Jz6Kb6Rf/lSWWPrhs0qtNttlvbXbE6/xTW?=
 =?us-ascii?Q?1VjzxkDL30XPTypY3f8gLmh/U87JSQJ5F9E1onhKMRy++csIKw+f1JRWfQqv?=
 =?us-ascii?Q?AgiSjgCbDWVc6PTBnCurqfBKXwoaZG7PTkCPgMaYyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dff1IgI/g5LAJQDfySt9ThuWBIquVdjVXAgvx51VreE9WqRdjWyfHm69eb6x?=
 =?us-ascii?Q?KGax9ZfD/JjFl/V2Yqk6WQ4eDPI/4vFYWn/jLhPFUYc4yz4AjUStbHrlc+4S?=
 =?us-ascii?Q?lAklFRLkp504c3NmTpepVi51Lbrtsa8w1RBtCn33LGgN56Dh7x4IDIhMGq6r?=
 =?us-ascii?Q?h6pyI+r2bllTQ70m0fOEmW8r1aeynBOZwsJ6cQQHDyvSFQcOcVs01FffOfq9?=
 =?us-ascii?Q?Wy0zRQco8yQOD/aD0xs6al6YBVuX7efhOIJnxKIoex4ugmdqZYEqPEcili4e?=
 =?us-ascii?Q?HcViagMwTL2wohzgpFcWJkOzPPHePPzIhpRG3FJey3OG7mfIW8DQZYLfluWW?=
 =?us-ascii?Q?zsSb1DuUhxg/G0da9QKiIy4FcHE66xoeQhOhZjrzKzIKBcQ81yNaHD6ptnUE?=
 =?us-ascii?Q?G8cjgiHpZdw2hV9wPtphY5tM0KxMhcjiDU1Q5HA9zFMjT/tu+Se/V+gA/nLi?=
 =?us-ascii?Q?5OKX3cmMAuciBh4aLj5pgm8bncjQ98z+VO6fyUWg4e+b5hfqJ2RmaxHUEOV6?=
 =?us-ascii?Q?u5I7ZV5GkOagcZpGX/9jCOmhhouGOl4EiQ2MSjNXoTdqBrk/TtlD6efqVwji?=
 =?us-ascii?Q?fu+Yjq3ItRpDVRB0XOR3KOeyi7VTGERgFWcrFRGjotnSUdTrOxXuuWQlGzy+?=
 =?us-ascii?Q?O5ledGX0SRgxjZwQdVBDPU1zxkmiRYxZWHQ021u53qa5+zp5sG2qYSGmtbiK?=
 =?us-ascii?Q?ql+GOk+UI47+lK/AvB/bBLOgBudMUq1T1kH96ZLMmvQT0eLSNCu1fhmu8y2w?=
 =?us-ascii?Q?GmuDpHHVwBnt7pg1grdVSfpUl+rmkv8HoGbcNQO/WkvBNtFkrX+HQyJ/XuA4?=
 =?us-ascii?Q?idpHBGzmr6NMWi364IZdpcyg14WOuf0QfJOeSP8JsVmE3D5uGZPTODrBLo8j?=
 =?us-ascii?Q?onGUfu7Deh+3yQde/m/cONVMqVLTDFdNG044+ybzEqD9Dyyr0wlU/OvqnSDC?=
 =?us-ascii?Q?I6KedNbGwt+1UlTY/8jRiq2hLQ4n9Ywqe4b4u4ZXYTpffHDOlFlibWKW0rhk?=
 =?us-ascii?Q?CbjMYcLTTsv9j4h5j0e+qJmf+vS5NWOen4ORixb7klL5ltVoTKv8hWW5GpgH?=
 =?us-ascii?Q?9GeLDRB2l/iU5T5/vShsTi64dajOAHvrkE+n0Eqp7lH2BvJ3Nye0UYVWEur4?=
 =?us-ascii?Q?6M8nM0Ttq1HoZVC8CmCCMNrkInl9I4rZPxM6tFM7cATS44oAbYYLV4lDmaKh?=
 =?us-ascii?Q?bgJdI+LTlp2nFCggKSLIlGWhwKtAAfTUP2frW2rWZYr8Y1AtcHpM7H91LTB8?=
 =?us-ascii?Q?Ci26Oazojrpv+uV8hE6QnH4QcdnyH/Yuw3KYEKTX6wL9rSqGs+PGJpiOTkOE?=
 =?us-ascii?Q?BLx+oyOLXdft1iSm4UUMSIGkI2nxKRNgYJO9EJQwO268wfFR7k4DQM1brYcD?=
 =?us-ascii?Q?Bm+weSzSov12JZKYPkgShacu6ev7xrjH2kmmlXzOnCQ1cpyjwXDLO8zSnYf+?=
 =?us-ascii?Q?Jmq9F/9E3EdbkU4/WjD+Qxo2gwLNyTssrRJYjc/QLS2yylMykwYgvKgr34Ii?=
 =?us-ascii?Q?6pr/5n0Y4TxcvGYwKPqsiEwYskvQETT1+Ja01eSWPkb7yeZ8e9TVstk/nq41?=
 =?us-ascii?Q?PaNpxbfgnflbbV5DEnLuI5oP3PFS/Y62Ij1RpPEs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	y4Fgk/ppucKMQ7XxvKQ6pKIFy4b08kdDXx7su3cz9WNlqaB9A6CfMfwxC7Ip0aume3x+3r/Uvt6HnkHNwr4rLQhvlRY+7NsGBeDWSitNkN9K+pwL223AaQSSM0d+AsmXL1FTgyemmsw03PxCeBsQyeBq2Sr5btP87IF/jxN+EB5LELWqgUmY5CliqTEI2bMzkK5f4sMzKF2McNWPG1A+0Lsj1PP+XE8HvUvrHuCONnbJnKvIfPFjOBkLlOZqWYwcGfYSPusGlRbCsFCQx8ph5j0wSGhN6DePYxJqvP1cA+XKr9FGuln4AFAI39ILOb2nNw9DXpBWO3hRK7HnP0IZR6Kiq5lWj7BcAKpF5F7Wc9ErcebyUOKhYlxGySnGs8wHEO9Z958MFN0GqsUBNAGpnERpbl76OiVY/+ckJsVxlA0cN8rSIzRElRoGN/em69taOnhoAEKa6qqOzsJzFQC9sOIPZMNB3jxIn4tGMNqCgHMSDdme2cEFvKbMvWME57H2VPVcIdpbKvYmDgqXlrKiw8s38/R5E/DEMt4lyT9DZqwr5P+uE7dGKNkQ9ftMMdPaw+73k2rFdOitbKau3d5C8gbnq7K4H8Vr57N/5PwAcLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91bfcb2-e2d0-4543-e05f-08dc84c1c8f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:41.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjxhnhW04nk5ZN8h3BHp0hEWlkqqbkoYg1Jk2Ae1T3pS3B42X/MuBdZbgTXsKptWKw955lnPyJeUlzRBNaBmhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: AFHqjWMi1AFenhBn-0pfUhY2QBAUnMxE
X-Proofpoint-GUID: AFHqjWMi1AFenhBn-0pfUhY2QBAUnMxE

From: Eugene Loh <eugene.loh@oracle.com>

For up-coming USDT-probe support, we need to update a BPF map
-- at least when the dtrace session starts but possibly also later
to support systemwide USDT tracing for processes that may start up
later.

One way to do this is with a USDT-specific update function.

For now, let's add a hook for providers to have provider-specific
update functions.  User space can either call

    for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
        if (dt_providers[i]->update)
            dt_providers[i]->update(...);
    }

any time it likes.  Or it can call dt_usdt.update(...).

This is for WIP.  A different approach can be adopted later instead.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844c..21ff15ad 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -68,6 +68,8 @@ typedef struct dt_provimpl {
 			      void *datap);
 	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
 			      void *datap);
+	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
+			      void *datap);
 } dt_provimpl_t;
 
 /* list dt_dtrace first */
-- 
2.18.4

