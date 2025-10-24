Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCFD2AE78
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 01:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270468; cv=fail; b=uaUb5jvqWO3SK22SP8h5sXb4BsWkzKMzRIrsgFw/qQqKLgUQzrcIRyu9GE2vJgq0qyo4Dew3H3EnpKM1LUFBvqd/uQ+DJIe2bDIY5EKlF3h6tS/+XasKfIw3IAbOwIMwKr6UnJHTF5/JQu6pvbGTrjZWcHm3N+VjRGNW0dqK+8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270468; c=relaxed/simple;
	bh=Sc1CrPem3HpxqyymlbdYkrvmOZt2Ve0hQPeY+uhJos0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nUrU4z5Lfvr2s8e7mpfI5mCke+DhsEmOVg0Z6xuVtRq9uGKyYJmV4fCNqYuuRSwobppUp32YXreAqsHlz5EGfed2wfAdC+DjLiH2P2GuAxmv3FR5d7zm5bW2YRPeWcHfNUo5dVXf949ASFQTYpv1pesFeHyVnNRqaYcptVdSiOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZqRgCkXr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U+vPQejS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZqRgCkXr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U+vPQejS"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNwnt006062
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 01:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AiRHcP+aIqTt7fKNX3
	3PHJCCCFCY1XvkF+uch0l5Vkw=; b=ZqRgCkXrG9TkGvc/r+l7cOCbqLOFgBx7/U
	cKMAN13DYC5kTcU9chGpKargE/wFHp464VBhwnywtfjfIRharHi1NY2poTz2nWVu
	MqQMDiUWzBprKeCoUkqH0I6N5yi6zBTsP4Ac4uExM6R2C3YThrue6M2AYeUBVe8/
	99khOCTtWibwBn+Wk0eYIYN+NTHQS0gvjSib+RLlIFEN2Z4ucVREvcJxqDKrC8/h
	nn5Gq1sFC53dhH7kwJP1g6NESJA1WGHBzNn1vznIdeGQXbebZ/MJ4mSKwW2sDFIL
	L8rruG7olQVUbrPP67xkfqSWVyVtDqdXuFQFy8+WUatChxRcRp2w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv5wkt32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 01:47:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NNcKoF012507
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 01:47:44 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bfa40w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 01:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHQ5JjdTR8g1oMJXsGii3V/jagNaAybbt8guht5ZLfurqCGr36zXz7q3ZGrqbiATrb/75F4EHrhqlYxQ8TaKWDS7oSKkf85y//8cVNbmWVjx8yA8mdFwgE5xAQywhB9oSTsqRVchkziCGXmkJByFBuBN9RF6oHzmJhq15Z2llN2YsVdaim14q9dZ4HqF2TwuYMtszkHLHUAjzjmrNzci2kYgOfzxIadk6ETdam2EaqepFZt9oOyk0gQ/vkXr1r58JVtBgPLt1wbgGMVRkqhUkyDpliXRMwAFb8weJFJKPS4jyhsdGZoE5NDZCzWfWFQtIROGmkBerbg6meOisdsKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiRHcP+aIqTt7fKNX33PHJCCCFCY1XvkF+uch0l5Vkw=;
 b=YGWKCtT5gNqvTFm+5LCOdJJUedj3hYCZfP0TuWUrLbHW6z2+vRkPyvSFzegAbrBI/MZyx9gti7AM0xQARMXX1mY2fabhjyzmL2CM3pjnbAyfjaClz984ya5y0inrfRn1FncF7CO246y40M5qcKwyCvaFCezLSGBqfEVeHA4OAzZAAd/cKCMqvv6gn4UnbQ9aUGn+pP6CNz1aCN3OC3fhYnCGZ8KEtZJ+YwVAZmJe9jt80jTYm5RQrSQA5LDQuiufKF9u2FPNPknQWDh0Jm2Z/HaA+Y65ibL5OnwK5LmSuqqIf5e4B9qw7iduzO/WN0gv+ZoRxX13woo2lzgFU4I0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiRHcP+aIqTt7fKNX33PHJCCCFCY1XvkF+uch0l5Vkw=;
 b=U+vPQejSDF3zmqBvpOYnfqHWpH3NZoJ30QAvp0czDQBgGkLadzCUfo1K2rYNI7uXeBpytDT63RL4AwZWSKmxbBB5MsujvkMbhrFdSeq0Xady16EIuDXUaxyD1WvXa/Imwg3/ZTJQADyu7XUpTAUeczCt8bWqFLa9GhY86FKaQ1M=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 01:47:41 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 01:47:41 +0000
Date: Thu, 23 Oct 2025 21:47:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] doc: Add rudimentary documentation for using [u]stack
 as a value
Message-ID: <aPrauoas4Qcopakh@oracle.com>
References: <20251023231500.25228-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023231500.25228-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BL4PR10MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: e57e7203-36e7-4139-21fe-08de129f51d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7NQXXDx0e1yknGYRUP1i1add2OYP7r8I7jKrQqCPFxnnKJOvLdUzoXCzvfoN?=
 =?us-ascii?Q?U3gYu1pRR6AzgGQqlJGjcpZXm8pL/991iDfplDyIIsBX8q2DJIW4/Zf6v6rk?=
 =?us-ascii?Q?5Gs2Zd/B2nzoO1cW01SdXiaV0jX8dYNwMBZCZrXP2l5LmciK5ILAanzRULkQ?=
 =?us-ascii?Q?ZeR4acpzJcQQfmQqQ4+JjWv+MYVmpm1qRbkzWIuXcWL9a0ikFt6YQP+5luma?=
 =?us-ascii?Q?7FldhiYF3rSMMWSrtjzWelkeqvSRwC27KGAbSB8SkpipLgZgOssZL9U75yPK?=
 =?us-ascii?Q?qs7WcdWB7pf4J7Nxop18gwWxU7Uv5qlfmntowm/hZ9V7Ni5qPm4bYA01sFML?=
 =?us-ascii?Q?16VNTnXjSN7V3FivCSRcLrrABfFhbmpbR9/GFLDQSAdlbcGJ9vfaT1E2FwW7?=
 =?us-ascii?Q?bpz2r7p32KOAF2e7vQoigs1J7sfFbXt4YIjSNqno68m+qsO8CAvG7xPRhLyB?=
 =?us-ascii?Q?uit+Ti9E9JW8CzDXmSBNjUIjC1h867Tw9IHtN6Ykx3h7c0dgN7xt8oQ8eHjw?=
 =?us-ascii?Q?659uHFKy+GDecXuZ292rKEfod1FaxslEDdlPiqljG6PhQ9vcwW9LSEOCoLzx?=
 =?us-ascii?Q?ta9DU3BuBd1OD1gLE23ZtkV4PIC91l7iX6AsuQzNOMlMbu7G+AxZ1C6FzRP9?=
 =?us-ascii?Q?xvJ+8NtgtBKsM2PvxZE9lYiDBtsXNi+OPdTXonwp0SCnHf8EW+YGiyGOdPmA?=
 =?us-ascii?Q?asINBzrX78V/DHHygbW+GBA1kdYcXvLQFMPJXv6Ytr22ajFRF5Zjefn2yvXe?=
 =?us-ascii?Q?SnTdY4yILzlrVAmTT8sViSnzIOlWy2nYtxgDYYocOnmIIu0gYAPxgXoVbIww?=
 =?us-ascii?Q?Vbhk/acMmEaEp4hMfsMcZL1YjNhhnHoYw+Z3pjPog2aQNe6Ze+o9Ub8DFefy?=
 =?us-ascii?Q?wg+l2pVvTe3+2Mos0alR9Ocrz/JPD7bCxgBzVgq8sTSbcg3FUb8zwzrWW4nl?=
 =?us-ascii?Q?Dr2dr0Oq48aDsXU3YHzqwos4pLCE5qlJDUouBJ9Wdblo+pbF2NsMmaGTrey2?=
 =?us-ascii?Q?86ZtnqV+Pxb3wpcHYvZ8VDKET1HP1sa4KnqLcjzN7CXoflahArG/lxmcgyuz?=
 =?us-ascii?Q?OqChSoapDID5+rIiLv0/G3vkAmMnam4E7xI2is6taFGHdUVUnqO2G6IqqA3+?=
 =?us-ascii?Q?c+GGb7W0rcm/TjifPC6K9WnU7Z4mTRlru6zURfTGezLTcBZ9h6igXuq4cGg9?=
 =?us-ascii?Q?Wd8eehiNE/Uj6gUaBDhWDJCaC3vll4PhFn84cq4v0PuBI+sfh6gtEsXIp/xq?=
 =?us-ascii?Q?7BmOrEzqNQDZzHp2+ZUmD/Ec4XYmRTtM5v9i4VphE9gRjgM7q55X+7psarao?=
 =?us-ascii?Q?bJIbF6R+HYQR6PP2/ejmGCTXGpZI3QpaCJ0MJ3DcQbaFaE0f0tRXs7Tb2Evq?=
 =?us-ascii?Q?50kTAOLSd1djJcK3PTw65PS1dZQCch3oNpClmr4K2bNNktseQqNzMankzm/d?=
 =?us-ascii?Q?j8o02igdqpRIrCEYlqLYkylTQ/mVCSG0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qmui/fWTSonr0oNvvJCzxGFMhbMZlpsUfB0dbaO1S0dA2/Ra3Vs8DbHXMPDk?=
 =?us-ascii?Q?lfI1UP+caUCUMMf8LbzHdG3qE6JI72HNpuidkbLhk6Ka4ARmZ0IfpZNFWOOo?=
 =?us-ascii?Q?z+UolBcF1vYSv3r8+No4E7+549XtjMUxdcefJ7VFQQYGUFmmjmPgmAd11YWQ?=
 =?us-ascii?Q?lo2AEIz1Xpm0tuDts0LepsojDpXO9u4n80Ll1D8TUFIubf7A2vAfsUgCRHz8?=
 =?us-ascii?Q?PTIW4wY/AOIeyTBAIFpA85KfyFFdIetyPDDjW4OxiGHFIdxbmylzcfCOzNmU?=
 =?us-ascii?Q?IP0+qlvhgNBeMUOtTJhDLSY1weYEkvIAObshr7o3WYBiJkiI53AypttwGGGs?=
 =?us-ascii?Q?/kqbIAMpGDmU3DWBojOpO6MPKhdd2vMtX/8R+PLSY6M1W1S5Gb4civmSrgWH?=
 =?us-ascii?Q?6DCqi09ceQRqwQfLf8qImvz7eKZocB5sXv97ngQy0HhBuTqRbwoLLO/bXoNM?=
 =?us-ascii?Q?qB6EbogJ0yCC3/GuZbgSZY8KBqPprSmjF7uVtzqbXshuIQe0Q7z2hMlRItr7?=
 =?us-ascii?Q?9FgigXLKRpgyhEgPw/KdrVpu9ehxKajPz3p/p4xyo7y9O8s7+Wx6JG9x2FIG?=
 =?us-ascii?Q?pA+aH/Nzq98BzKXwIFMi0GK3YjV3eoI1vSK+cGEs7ZoYvvSiVSyxDX9hiIZT?=
 =?us-ascii?Q?p4RhGmiPUrsM8w206wCzVHvGMBpbih6LLM0IJKeQ1XgyURqqfw0ZtmN80Kor?=
 =?us-ascii?Q?LRJiTS2DOd16vrXlv8u2nC+ULK3Gmdcjpb7OX/78B0DK6v6H/KfCZyNCoHL9?=
 =?us-ascii?Q?Mue4pL88qyvl/q/lE2EVgxpMJN3MNjJ3JSH8MlKTzlNZTol8wGQBM18GWcOx?=
 =?us-ascii?Q?foJyr56HH7wGdEC/jAGzjZwha28mZ1wcBgjY0DCRPKoHxSshvz3RbRsHDDQi?=
 =?us-ascii?Q?xS+ojM3olnP2xvPe2O9odabPfs0ZBfX7kvPNWG2emEbKC2K2+TqsUWcn5zUJ?=
 =?us-ascii?Q?LCh4RkbWE67j/sMxiz8ZWQbHEWql5mSxsGQhpQFbEX6/Ov2Ml9O/5MtNhmGL?=
 =?us-ascii?Q?YX2HyJ2Qia8Najy4IjSBItTprKz57tPE+6+iDnTxtaexEAN2QIAJI5bzfjd0?=
 =?us-ascii?Q?TO/IXP3CPPYE4EyvabMrptdTZPT6AgYMcMmXgIyBxJPqqQlNvehl9XgQ5e9A?=
 =?us-ascii?Q?26syf26s52jMNFqw9mVwTbS+Le6R403INBiK2pOAevnQ5U1yyhnQ2RadHAg2?=
 =?us-ascii?Q?zoh2Ux5ufumImHKgRrpH0w76Vuhws3wd2yvpVjqs5anW2FtcNIwBNyPjZ/ls?=
 =?us-ascii?Q?/ZHoidq4WcsoE6bbyFY4F2q4yBeNk4BiGKp9vYOuFrbS1gkN6Vz7nB2dkX0F?=
 =?us-ascii?Q?CVXlAc6xVBaF+JKQkmTSr8p3aCd2Rf9QaxxhVwhfqWgInBz65vENKRmXWFru?=
 =?us-ascii?Q?fWi+zQSUB06dVVfzURlCgYOlITpkbVv2m08S2bmgqHNbKsh8rTufn69tzdbo?=
 =?us-ascii?Q?NUD0X06DbbP4qb8OT/ogfFc95Y0k/oize6d7niu6g6y4SGXx3UqK1p0XSdbO?=
 =?us-ascii?Q?HCk/+jVHTpg+a58nGJ5Zh/ODyh3LpQG8CoivO3PG/CzcjsXsklKRealCWOWN?=
 =?us-ascii?Q?bVqHWxVrG+xaVwD5DXbcP0MLZrlUWcth3a6MrD2Gj2Whg2dbieT+gnw0nKSA?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ORV8x87TSQcfr4Ac4qLZaacjRZpMUUCB6C5cZh1gAIKwE81F/hOEVdezTT4TQTavE7ZoEuXNM2whVSXrRS3b6/7DQqZEdlaK3cUOdXZX8vydK9x3dKrQSfp52PtyTNgaC55HgbU098DC8ndUQVDKmx9ulRdEc08qQn2iJPJ6WdxQlUWniHtE5tw8n4lH0X5IJzwtS4yYAFI/J/NDA5Fo4nHFFOSDOs3RwENRKK7QSQV10wJ3wCNc6zP2pwQKY+nJtMYhQ6Mfuf1lUnCglfwZFbhM5hIgMD4K9RhLXzwe2eo0PiqF5M03u7NbV7AKb9GWZjkjGdPcsUuIJRHTKYG2LQgkyTYkR2/vNE9WqyVPsXOzRKej1S3QqW3DE1DG60sQYjHs/icTtq7Zxk64uIy4pTsKN/WFr+gZQrCfzofdiriqwsvZbCrsuggdN1hVsxfEhP8akUzTa2HbmBR17PQKwFDkioup2LNYaZAiuqz16dPXXtTXckLq8LmXTNGGfb9yO0FdXqvfH5tyz8EG2NlZIBLfs/rwFQlyS0xp11wQQ/0AeWYynlK+it0G5Nz9MASiIamAxWj+ksiuGHKngtlnjH++WiYtD8VTrh+r0eLNIfw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57e7203-36e7-4139-21fe-08de129f51d6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 01:47:41.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wev4M8q4+x1LVjOqJaqzNqlaQjtURP40WFvYzxKjxxR/KNP4WtUFB7dHilZ5qO9In7XA8GaQZNyjMWbXl/OK+TUrhyCNYmy1v3mRazsREzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX26RkKP0VOv6C
 SauTowEO0JjHU9s+KZrilcIJkoToI6BxYVJQA9DVHrI07aYb0SjuMUl8LpzCEIACdEx30xaO5oC
 YqgQKhw8Nc0Va/GE2oAQMU6sIZkjMcQwEw8oB6pewDNrrbVXi52bJAetNBUcskEdrtUVRJcmswX
 qcLvl5It+PG+afpFRs61kkAXhlRLSPinD0Q3YSol0p5BWispMdOFD1n99JOyu71kivOhYqz6D1r
 wN8SnSaiE+Fg57Lg9Y5e+MRcctEcIQrmyutxcAOf6AiiWvN5D1NzxVScirPsUQpMDhHWh/E6lS9
 d73EqSQplHWHHapCo+3lwCOaztKzoKanCRANWZq2OwYOl2gxB7PBn6nYLc2+yCrCU7n+JnQuSCY
 31/TCMA7JpCKlP+uSh2TAj4vpVb1hg==
X-Proofpoint-GUID: eMBWQ1U5h1FEHurtuXeE9oHaxmrhiQsn
X-Proofpoint-ORIG-GUID: eMBWQ1U5h1FEHurtuXeE9oHaxmrhiQsn
X-Authority-Analysis: v=2.4 cv=RfOdyltv c=1 sm=1 tr=0 ts=68fadac1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=JsI4sMX3MLxJo44k3DIA:9 a=CjuIK1q_8ugA:10

On Thu, Oct 23, 2025 at 07:15:00PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While we are at it, break up some of the super long source lines for
> future maintainability of these files.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/userguide/reference/function_stack.md  | 26 +++++++++++---
>  doc/userguide/reference/function_ustack.md | 41 +++++++++++++++++-----
>  2 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
> index a92c61a0f..903d3f090 100644
> --- a/doc/userguide/reference/function_stack.md
> +++ b/doc/userguide/reference/function_stack.md
> @@ -1,17 +1,33 @@
>  
>  # stack
>  
> -Records a stack trace to the buffer.
> +Retrieves the kernel call stack.
>  
>  ```
> -stack stack([uint32_t *frames*])
> +dt_stack_t stack([uint32_t *frames*])
>  ```
>  
> -The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> +Returns a `dt_stack_t` value that can be stored in a variable,
> +including an associative array element,
> +or used as a key to an aggregation or associative array.  
>  
> -The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
> +When `stack();` appears alone, as a singular action,
> +it records a stack trace to the output buffer.
>  
> -## How to use stack to obtain a kernel stack trace for a particular probe
> +One can optionally specify a number of frames.
> +If no value is specified, the number specified by the `stackframes` runtime option is used.
> +Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
> +
> +## How to use stack
> +
> +Here `stack()` is used to assign to a variable and print later using `%k` conversion.
> +
> +```
> +        v = stack(3);
> +        printf("%k", v);
> +```
> +
> +In this example, `stack()` is an action that prints the kernel stack.
>  
>  ```
>  fbt::ksys_write:entry
> diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
> index be9436f82..2ab6afe3b 100644
> --- a/doc/userguide/reference/function_ustack.md
> +++ b/doc/userguide/reference/function_ustack.md
> @@ -1,17 +1,44 @@
>  
>  # ustack
>  
> -Records a user stack trace to the directed buffer.
> +Retrieves the call stack in user space.
>  
>  ```
> -stack ustack([uint32_t *nframes*, uint32_t *strsize*])
> +dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
>  ```
>  
> -The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
> +Returns a `dt_stack_t` value that can be stored in a variable,
> +including an associative array element, 
> +or used as a key to an aggregation or associative array.
>  
> -The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +When `ustack();` appears alone, as a singular action,
> +it records a user stack trace to the output buffer.
>  
> -## How to use ustack to trace a stack with no address-to-symbol translation
> +One can optionally specify a number of frames.
> +If no value is specified, the number specified by the `ustackframes` runtime option is used.
> +Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
> +
> +Stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
> +
> +**Note**:  Historically, if *strsize* was specified and non zero,
> +`ustack` would allocate the specified amount of string space and then use it to perform address-to-symbol translation directly from the kernel.
> +Such direct user symbol translation was used only with stacktrace helpers that supported this usage with DTrace.
> +If such frames could not be translated, the frames would appear only as hexadecimal addresses.
> +Currently, *strsize* is ignored.
> +
> +The `ustack` symbol translation occurs after the stack data is recorded.
> +Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
> +If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +
> +## How to use ustack
> +
> +This example shows a D clause that stores the user stack to a global variable,
> +then later print it with a `%k` conversion:
> +
> +```
> +        v = ustack(3);
> +        printf("%k", v);
> +```
>  
>  The example shows how to use `ustack` to trace the stack for an `openat` system call by the `date` command.
>  
> @@ -19,7 +46,7 @@ The example shows how to use `ustack` to trace the stack for an `openat` system
>  sudo dtrace -qn syscall::openat:entry'/pid == $target/{ustack();}' -c 'date'
>  ```
>  
> -Generates output similar to the following:
> +This generates output similar to the following:
>  
>  ```
>  CPU     ID                    FUNCTION:NAME
> @@ -35,7 +62,5 @@ Mon 20 Feb 17:38:15 GMT 2023
>                0x7f6d63fc2e65
>  ```
>  
> -
> -
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> -- 
> 2.47.3
> 
