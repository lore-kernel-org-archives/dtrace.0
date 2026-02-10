Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C032FA32
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754474; cv=fail; b=ChywV7RQyyuBNttId5N7MBvLNJoXBlX2yqfUzMo+iwVSKafsUdhSbJVfKpZN24pXkrKqcK/QX/8xt1WqJ5GLyCYvFZmi8AbxeD2Sxkspkx1d8DxSaZ1SdzCCW1xBTq96Mxs/KyXd6ap9gxtoeGhm1n6DWq8nnDc6bIIKpo1EMSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754474; c=relaxed/simple;
	bh=7398IFKRzuWZ61du3Ro6sav/lbIlYqGih5bgBxMS5KI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RVguD5yCP/M3HzJsenUUA9CVXwOLri0UerlF6SHsaC714mqE9IqlE55N8bSQaD3aEr5QnlhLRhD5v1JUNV4x+/1SjStNHNO5yU0VcqkWkLZB+ret7I1OTzN3r1BIn8/fqw4843Ck8SqWNSztbAZQbicC5TZWnFPJ9cGLGVuGSfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q5c1Z5EH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SqT/xBE+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q5c1Z5EH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SqT/xBE+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AGjkK23810107
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 18:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GZXM4RWWoizdQd8/BPswv8MXm1XnzjUaVAG075jTeao=; b=
	Q5c1Z5EHCVpTAHxUy80u7+9862tQjDyNKlOBv/9Zr2zOjiOSLvZ1BO6XNifTbUwI
	sPDHz34d8YUGCdFLcNaJeYfZEruGckPp+J4bWR4W8kCjHprH/3gzaJzhr1mbPmA6
	m0rZs9ue+Z0jVscDnGEdWKXT3ueczhv5l6tA0gMXxb2CHSmiOjRlsvrgCFaY/ynt
	wzaWjuoGld3Dytjy/YvKHqywJSq7E5rHtX75/ZujRaU4Vt3QFjVgNh4xK2ETagLy
	a9KUt2YFcIv+IbiOVFTmWkK3plL0FapgAxE2eEo5YbMKMcsKhTFLTY6KC/fUm7vc
	ud0vlWp9747P5DJYSQNNCw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88fv06wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 18:39:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AHxZEx013026
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 18:39:31 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c826ydhgd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 18:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4ax3jJXHgPypembx52WvveOg95d8Ag4yR0fP5ye/5Jl7rsDAzmLValQIptqURqB2YzGgNsNYg09Zv9y0mtTpQQUFk+ssPA/Zdt4oAtorpR0u/f/dpn7UFhNL7qxbkPVeS8t30ugtF7p3sTe93JU/XDHtj5J3WSkRwle7oAxNXi292d0YO7sR60vNxtpasJIig/DXgkw43AHPFsJCc3RtG/4sHSWj7Tysi4w59RvKcs2CT1nxSPwRHUGkGwQvJXJvQ/myPhTd9sHeznDGtY3CBt5oGyZQ1koeFcvAXMg2eoXKC5A08EjZ0ohHcdGXXlDZPtkXds1J4ACu9sdRWjoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZXM4RWWoizdQd8/BPswv8MXm1XnzjUaVAG075jTeao=;
 b=ONuHVwXRlV0DcW/Jj1KbEdjPn1ze/LfBkzcASa8kFjUyMLcV5IqDOMXEv/UCeTEt7I4ciHyrZQnuku1mfuY/UiR7p2Pxxi8yOgvpffUAyq5rRiYmdsgh93kRn0ePloajPQ+GMWyLWD8nADy624ZCWFp6VoOGz2cONfZyk+T2ZbEi7FpVLfKJXnYd3HlnM1pIkZy3GexgCG5jC6HFuqhZ03L17eqqv7b2w1kZau3vx/9q1QUMdUmepCK585+wjyvgPzSY5bctgZojTWybNJzaVTEqJdgQFP+1LALwunqMu2/QHd6tf/Yd+6AIWf2CLewFop5oQOEIgWKx/SAV8SZ73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZXM4RWWoizdQd8/BPswv8MXm1XnzjUaVAG075jTeao=;
 b=SqT/xBE+fkjktPfyOJQp4TkTQlus+Cq0vk8whnT1COGzh2C2ldhtJ5+KvE/xv37yWQOl3hUzpkOjrY5XeAAO5Hg+mM4PmpgkmAZWA8w7H5+EUMiek1464A/M1/d3vyLmBNAkZNlNOWemL1FXJufnKxGI+IWSVeGmRhN/NlYAwb8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6808.namprd10.prod.outlook.com (2603:10b6:208:428::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 18:39:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 18:39:27 +0000
Message-ID: <cf9a29c8-e86a-5293-dc85-189ee7a0239a@oracle.com>
Date: Tue, 10 Feb 2026 13:39:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] test: account for member name change in
 mm_struct
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522BEBEF1650BD20A9A7214C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522BEBEF1650BD20A9A7214C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: e914e5ef-cd0f-41eb-aa8e-08de68d3b7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU5oS2J6ZVU0YXY4cjV1UmQ3K2tGU2NBd0JQeDBWMVRUNGdEaFFMeUtHbWlR?=
 =?utf-8?B?TGV0VmxLbHU0d0dudUdMKzdjUWllR2EvK2JqWHpuZjFhTUh0VG1hNWU4dmxT?=
 =?utf-8?B?a1RpVkdJR0h4OWV1emphTWRxREJLRHFBNTlWTTYzVW1FQ2cvZGNBMkRhbWlv?=
 =?utf-8?B?Vm5JN2FsUkdMWVhtbTVXblhkbDhEemhmOFB6L09nQWx0U3ZqRi9WM3FIWWQ3?=
 =?utf-8?B?WmViQ0Rrc2JLb25BU1VHTEZ3T1Z0N3Q1RU1SemlqWmo2YnpGRTErMFRmTjM3?=
 =?utf-8?B?YU9PUklEMytWQ1FHTGI3Y1NMM1Q0SHR4NDBKWCtMQm1oRTgwZHBpcEVmbjBq?=
 =?utf-8?B?SitpTUFzL0s2a0ZMdWE5VHN5WWdnUkp0Mnh3b00vWkdLQU50ZjZyeFVmVERp?=
 =?utf-8?B?WG9YTGhxc3FQVEZ1QWtoREpFa2lEV0NYTnI3SENBTmllTUlrSTQ5ZmFhQ285?=
 =?utf-8?B?WmE0RVlpeGJTUkFIaWM3bTNzclpTUWxCN0lWOFdLaGN2WUI2d1Bxamp5NkY2?=
 =?utf-8?B?RFJndUxWbjJrN3NVL0p1REVlMFp3YWxPdDl3RXNjS2JwTnpHR09BMkhTNC8r?=
 =?utf-8?B?MXdFOWlEWkU2b29OMWoxMjFEZW12MzJydGtYenVEQXpkcEV2ZmNUQWtSTVdo?=
 =?utf-8?B?MFdqbmVWelFIdVI5Z3J0MjlrZDdYeVVxTGtJL2hBL3dMVDB4YWdqdzIxamJH?=
 =?utf-8?B?eEV6d25WOXpleFVBblhGMWczUjJhNXpmS0FKNnY2dmxrYklrWlBGczFhaVQ4?=
 =?utf-8?B?M2wydDNuc0xQanVvNUZ3Z3U1Z3Nib2ZZSmEzTElTV1lFcEdKMXl4ZzNTTlc5?=
 =?utf-8?B?bEFPZm9OWGZRMVRTRDFmU2czMXpka1dEKzhpdGJsNk41Um84cmdMMVVERHZG?=
 =?utf-8?B?YWVXOTZLUEh2QlR5bVpKa0MzVTljSkwyY2d3TkI5VTNmMVhPR2xQVlZSeXZV?=
 =?utf-8?B?NTNrU2VyME1vZkFlYUdQckdDNlpiZUxROWNUYlZBeGkxYjUxUUxmVHhmTExK?=
 =?utf-8?B?V25WanMzRVo4ME5vdVIwS3lEQzZyOVA5RC8yMHdMRFdZbDdONW80MldhbzJh?=
 =?utf-8?B?OG5WWnRncGM2S2d1VWM5N0h0UmlnM3hJUWthSktpTUx1L3NtdU1qZkpYRDZu?=
 =?utf-8?B?YmpURmc1Wi9UallPTlNrVjcrV3laZDJRNExGRm9RQ0l1UTYwS0sxWksxaXcv?=
 =?utf-8?B?OVRtVDk3d3dhbktrZkYwcUtsOTQ5VTlvcUx3ZExGU1c4MmdrbUVRRlgzSTN5?=
 =?utf-8?B?SWNmYmN4a0ZMbmhzVUxrcStDOHdYL05jWUhGSSszT1lEd3o5dDYreTN1YkJT?=
 =?utf-8?B?Z2xSRDlTNjJOU1RSZTNONjdWbXN5dE82cEREZUxEbWt4UFA2WGZ5NFIvSEhR?=
 =?utf-8?B?ZzNKaVhyaGxneS8wNzNHbkVWQ2ZBVGZIb3Y5MmZHQWdaMUZGTnFqYTVYUmFZ?=
 =?utf-8?B?L0pFNmtVVWZMUWp4bThnWENJdzhIeXQ3czFvZ1JxdERaZnJ0bGNRUGdJODRq?=
 =?utf-8?B?WkIyRUsxcnp6TStVSDVacWVWM3NWZXF4SFc4UkJoc2VOalBwdnFJYmsrQ1Rz?=
 =?utf-8?B?aWxsVGxsNEdTb2VYcnFCTUdzbjcvVUdFaWRNYmN4YXdpcWdnL2h2K1NkT3dv?=
 =?utf-8?B?bjd0aW04Yy9YSjNaU0VOU0QybFJaazdIMXN2UVoraG9QQVpZY0I3ekpKY2p6?=
 =?utf-8?B?L2R1WVU2UzNNeTlGYXEwL2N2SlBEVEpzVS9TRnpGeWpNTU1TN3F4YzYydWdO?=
 =?utf-8?B?aUxBaDdwTXNXOFp6dzJUZVNJUFhkUWZjaFprZDJVSHE1dXo4VmhSZm9rUzZs?=
 =?utf-8?B?MWZPR3VCMkZWTGlZS3E2WlIzUHBDb1NUTEdUSmNKSTEwdVowVkZvTjdjV2Zp?=
 =?utf-8?B?eHV5blZRMm9GTStJUktaSXVtWWR0aWJlYWpUajZuRW91dXIrcnNxM3JJYnFY?=
 =?utf-8?B?MUVYYjVlN1JXVW1HWC9JN3VxOU4zdjRwUWpsL21CWkU3M2lqZG9CbExsZE9M?=
 =?utf-8?B?eEQzajBHcjMvQzBGbU11Z0Zqalk0WG1YT3JQSWJ2OCtESmVBUXpuK00zeDV4?=
 =?utf-8?B?VkdDYWJIUVNoYWJEVUh5emMrK1BMTHVjb0ZOTklzbnJGcDJMVnpIS0xFcmF4?=
 =?utf-8?Q?iwZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmE5UDVpUXBqSEt4K0J2OEJNUHE4R1RGWkxFTjMxZTZCRThlMXZrejlmb0RO?=
 =?utf-8?B?TzdDTk9FME1wWXVLeUpMKzR0dGpVU1lLOXR0RkRkbURscG4xaTgvdU9nSDYr?=
 =?utf-8?B?c3FUbVZkZlhwZjZtNEtWb1Bqd3dJT0JOMSttcXRpSzJBUUwzQXJsSlNtUmxh?=
 =?utf-8?B?V1BKYS9IcGlYOWtIaXlrZzd1UzNOQTBvRHJqQlEvdkx5N2JackhTRk9JZFJS?=
 =?utf-8?B?QkNKaGIvbElpTGgwTGRIc1p2K1lodXVyUVc5KytOLzBHMUVVZlB4WGM0OS9v?=
 =?utf-8?B?V2dEVzRwQldWR2dvcVduQlh6YXFEWm03bnpYakVyVmdaZXcvSHppQ2R3VG1w?=
 =?utf-8?B?OG80d1ZtZWlwb1dwYWJ0WEZOeHVGT2lYVEprZXpENWs1Z1VUYmtLYlR4Y3lE?=
 =?utf-8?B?VjljRFNibHVGQW1YTkZkT0Rrc2dJcXNXRjR5dzRaMkxvc09NS082bzRHSnVu?=
 =?utf-8?B?Q1gzdW9XcnE2eXl1bW85ZlRKSUVSVGREMllxVzNodUdyRDVoc0Y5akVOT1A3?=
 =?utf-8?B?YkxsSEpuRjRCUzRQR3hRVnBkcGdLaFZKbGtiM0ZQK3ZpWlBJRFlEdm9ieDFK?=
 =?utf-8?B?Slh2a2lYWG1QaEpadEJQS3ZBNitmWHE2Wm14bU5lS29XVktDZThmZDNzUlFt?=
 =?utf-8?B?YmdUM0xIL3h5cjRZblNvdWhXYmRtVkwzZUM5VXVDaWRmT3RRVzhYcFg4Tnk2?=
 =?utf-8?B?M1hQS1F1QlpJK0dQeGIrV0NUWGdkelZqSWFyeW9sYXZPNWhlVmhWMXdHbnFZ?=
 =?utf-8?B?WTFQejFZZm1xRlJWQXBQbXVjTWJ5NjlTNmthaHJwS2I2OVowb281cWlnTHFX?=
 =?utf-8?B?UVhJejlZODlmRkRlSnRzbDB6MVcwcVFhRGxydWY5S2RZZmd1UVdmU3FkSWJV?=
 =?utf-8?B?YklXODBHRWlZbnNML2g3RHR0Mm5zUmEzNDZGQXhJU2FBVkxhOVBWWC9pTlh6?=
 =?utf-8?B?ajAwL2NEUytHMjc1YkJEcHZHSyt4VzZPdkw2U2d2bGlXNldOelM3LytlanhI?=
 =?utf-8?B?ZzBLWmpBc2NDaTRnanNvSXZveEMrdmlzeVp2T2FDYVBYYmpEbnpUQ0JlaVVH?=
 =?utf-8?B?MFlXTTh4YlFLdkNuSlVZc2ZYNjBZTXZpODZBOVJsYTZnK1Jnczg2SU1EaEJs?=
 =?utf-8?B?dFo4cWxPU05uV25vZTd6VjJvTkYyd2kvTXhHZU85eEtRbnBoeEsvWkJSeEVL?=
 =?utf-8?B?UGdKc2FpS3JDZFNFcWdvaVNFK1c2R1NleVNPMFdSRjNiaDA3MlFYbjE2RFg4?=
 =?utf-8?B?NWc0TGk3cUNKYjlCVjY4bGd0RXo3RXFncE9RWGMwV3ZqZXhUL2p6cTk0SHJW?=
 =?utf-8?B?SllucjltUEhGZkpSTHV4RStVNEg3NGw5QndSNCtENG1wSitYc0pUWkhFRE1D?=
 =?utf-8?B?R3NyMVVoQVg5cVdiVjFjdUppOTUxRmxkbHdXN3NqRXJjazdUV1RHU0hPYWFm?=
 =?utf-8?B?TmdtM3NEWktvOTQzQUNseTVGbUJqVWs2dXVWdnVJbWtVMjR0WHp3alJsNSs1?=
 =?utf-8?B?WTBxVGhGcVIxZ2E0SldraHAxQm9ONkxnb0pJY01vUzk3cWFFYzUxaEZEVUN0?=
 =?utf-8?B?R0lCMkc2SEsvQmpXc3d1Z1ZHaVJUYWRGM1JoNUpvWUFDRUNML2Y1UEZXNGRX?=
 =?utf-8?B?dytJbE5uMDJCYjA5MVRKSDdTdUY1SFMrT1BPeVVSWFdJNHdpcVkvOEtoeHBI?=
 =?utf-8?B?bnhGWkxYNmFMSFdxU1kxS2JjSC85UFFnc3k3eUJ5SFRlaXVRek44MEZoSmZJ?=
 =?utf-8?B?dXIySzY0N0NXZWo5Y1hnaFFOUDRDMjVOQnpRcFFpckdxU0hiOExNRnN1anZY?=
 =?utf-8?B?WitOZjBieElhd1JtTVc4bmNhVlR0TkNYQ0gvanIxRXhrbEhvVzFxVU5xSFhx?=
 =?utf-8?B?dWM2S2l5V2xwMjBsb0xkVUJCVVRLK3Q5NUcwc2FOT25ISnV4N0xqUkthMlNV?=
 =?utf-8?B?eEtuZ0U4M2JuMWVGanlSd0F1azJHY3psaE1IS0RheHc1SW9VcUw2VU1rQTFF?=
 =?utf-8?B?KzBFVUdEcVA4ZjIzVTg1eUtIVE9JNDF5eXpIQmRFSEJwQkJxMVFIY2MyaFEv?=
 =?utf-8?B?TlFHbVhQK3FiR3Npc29BYnBuSmlweHVQSWZva2lST2NyZHpQbnBkemhTOU5K?=
 =?utf-8?B?ankyYisxZXNXc3d5VUd1eGVTTGNqMWJ0VkZXYWhOajZ3RkhSV0pueU5NdzRF?=
 =?utf-8?B?eFl0ajFyNzVVT0pBV3pKU3loL0I0Wkd0RWNuRjlsZGlSaFpER2NOeG85cldP?=
 =?utf-8?B?bDJkUkwwQjh5bXdHWG5GQ2FSd3UvTkpoVXJaRjlOYjZtUXNGNnZyQlpDcWpB?=
 =?utf-8?B?dXRyeDVqNmpDMFQwNTBiRWYycTlyV0htR0lDWUNRUUEwUjZPZ1lGQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1b/sdXyFY5Ma/pdSPpamuXicCnM0bQXz80Q515io77AeUZFORXISkAJU+uBvI4ns8MptveXXIh0FJpxsboSyoxpgZl18iDk1RJVCdffQ+3DMudHtO3g2g3cqGP9TFVeWQg1FSf1AkyhsWSCq/Sqwb4Tunz9qSRxAA2A7lx/tRnWpYDjmpzXmkS1HgYG7FC50j1LL/MrXCxGtvWcUGfuaitFYLihKVp7fvIMTKL35M3Db1W317lLC0y4g6vHJ+/3bPkRkEI1A08tUtE8+e9T5+wbs9YRJ6mShur3AEUHvAVDEfslmphdidmZDNe10EfZ0YAsR6ONWcPYbMMuyhudIafAI018W9TBAUc4ULV6wd0WIRoYOJ/D+j3md9+HTIWIwzcpHK6DZFGEHVoEOdtXlPKS2m9P3Wv2wKeqUhzzcindZ93jRwFOW+/8Mt1B/dgbvqWPDXmyaq2LpfuDApcKp2sbOhQ5vHrVI1LeBpa6feA0Cp1gBFI/lsBiCJR7800fLDndXvFYJwCghZdPYVwSSm+AIxPaYV/gZ66EQYBe8Zj5fHak+6JP6jqNP4qoSCLXfUnocMcd5xxiP1KPInnjLpkQIeeua+2h3tkfFi/HMdBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e914e5ef-cd0f-41eb-aa8e-08de68d3b7e4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:39:27.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbLNx8sSbLl6dbWf+hfGIOgRqarKqovX3Y4JXQbYyIVcMgkS4IIdWmlND/bZEvtregYzXbo3RLRxlypskG4Szg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100155
X-Proofpoint-ORIG-GUID: HohWVKUaU90tJY2u3JILs4JsRpqwr0qG
X-Authority-Analysis: v=2.4 cv=Qchrf8bv c=1 sm=1 tr=0 ts=698b7b65 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=VlkGvKDkcC7uFZLO-ZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13697
X-Proofpoint-GUID: HohWVKUaU90tJY2u3JILs4JsRpqwr0qG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE1NiBTYWx0ZWRfXwbdqCW+Dec+P
 4Z44FFS9023LFtqQLjlO+xuftks5HTHG3rYfP50+VPXi8o+4OtuzcVdK9gs556dLuuHhM9wU+Br
 6gxV66awlRs3AwBy8PmsI6BYfuyDajkkzQfawgrL2DCGlGEmOgqMXJxi2LUPV43EaM3FZod2Gut
 ZGZgBBMBAcKanH8WN6bYul6F1iswNiXRzELPSPN3f5+04+Xk10zCPaImImI8AD6FivD98OQRvqF
 hu2cxuL1lJygUgo8kaEPNyk/ilrKHRoysvyVHCdU0DWYOmNye4tN+lqnqtF6zmVut/kbPj9Opx8
 60uoUaTz6J5ICNXwzFrveyahIXHu84goG9hQosfi5vbYpeSP9R9T0YRfFjU+Jrc2Of3K9a4Xoxy
 4+jtA1kWf0DdL9BlDjhu5eOKpjfiyVDfZb4l3KnuEQFW8kajIGvfs0ls1dc24TE5dLR5iS5KHJ0
 vwuUGbhCZIzzIEcvGSBr4T/KQ9EGKutyJe4kMlL0=

A few minor comments:

On 2/10/26 12:35, Kris Van Hees via DTrace-devel wrote:
> The flexible array at the end of the mm_struct has changed name in newer
> kernels.  Rather than depending on a particular name, we can simply get
> the name of the last member (since that is there the flexible array is
> always found) and try to use that.
>
> The testsuite gains a dependency on bpftool for this test.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dtrace.spec                                   |  2 +-
>   .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
>   .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 43 +++++++++++++++++++
>   3 files changed, 44 insertions(+), 26 deletions(-)
>   delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
>   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
>
> diff --git a/dtrace.spec b/dtrace.spec
> index d6af5a80..e0d832ac 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -115,7 +115,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>   Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
>   Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>   Requires:     coreutils wireshark %{glibc32}
> -Requires:     time bc nfs-utils
> +Requires:     time bc nfs-utils bpftool
>   Suggests:     kernel-uek-tools
>   Autoreq:      0
>   Group:	      Development/System
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> deleted file mode 100644
> index f3801454..00000000
> --- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> - *	      (ensuring the bounds checking is also bypassed at runtime).
> - *
> - * SECTION: Pointers and Arrays/Array Declarations and Storage
> - */
> -
> -BEGIN
> -{
> -	i = pid - pid;			/* Non-constant 0 value. */
> -	trace(curthread->mm->cpu_bitmap[i]);
> -	exit(0);
> -}
> -
> -ERROR
> -{
> -	exit(1);
> -}
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> new file mode 100755
> index 00000000..60fe6afc
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> @@ -0,0 +1,43 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> +#            (ensuring the bounds checking is also bypassed at runtime).
> +#
> +# SECTION: Pointers and Arrays/Array Declarations and Storage
> +
> +dtrace=$1
> +
> +# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
> +# see which member name the current kernel uses.  Since it is always the last
> +# member of mm_struct, we just use that member name, and hope for the best.
> +# If mm_struct ever gets changed to not have a flesible array at its end, this

s/flesible/flexible/

> +# test will need a new structure to work with.
> +# are out of luck.

/are out of luck/d

> +
> +# Determine the member name we should use.
> +member=`bpftool btf dump id 1 | \
> +		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
> +		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
> +		     /^\[[0-9]+\] [A-Z]+ \047/ && in_mm { print fld; exit; }'`

The search for the end of STRUCT looks for [A-Z]+, but could there be a 
'_' in there?  E.g., for "FUNC_PROTO"?

> +
> +
> +# Try to access the flexible array.
> +$dtrace $dt_flags -qn "
> +BEGIN
> +{
> +	i = pid - pid;			/* non-constant 0 value */
> +	v = curthread->mm->$member[i];
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}"
> +
> +echo $?
