Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE35200BB2
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742246162; cv=fail; b=PwM7nfRIfHCi5Hd2bVJzfT1uWww12x2URXi69t0819CO0GUZgGCcINBgps9QUhVSq5mZ7VH1qxuaun9CDaiTXdN36ezZpJycOTF0oPsSUCmDEjYfdnafqF9u0Vd+Arj2XuEgLeoNEkhOcCaOZ7QaYArkr9Sf4F/Xu4SAs+90caU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742246162; c=relaxed/simple;
	bh=FPLXrB7UCzwi+0wDIHvqw6xNXF0W5gi9s3UaWEiP5rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d3dayLtHD3LCq5roLCx6REBUUFOxLzUZ56Z03C/Ro87iBNxub7WLfmi4ppiyb/cQ+bawme+0Z1xV235CzmR8JmeLQHPIsfVFoGrIj0YsfnmGYdT+ppodjriBUGWU1JYMshgnuvi6fICqv6bDhBOACRVGzbCM7YqfkOsY5FgSIU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XpevyBIv; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i5dZM8sg reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XpevyBIv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i5dZM8sg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKxTIF030444
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=h6PMHycP4I93kWALtXIrHk8qfWDytZY3wTXSpgf+YLY=; b=
	XpevyBIvjM8OpYz/TgCww1xnuWhn83VEgePgmWbiqgaPUEYXyezmZ0CxcI4XZgFS
	5u0A1ClDfD/LltMM8d0j6mz8yTswwsx//rHeNmSycBl35kXnkmCF/BHYreqGyoJ0
	dr/MLu6jMecem+K+q8c4XvaD0hfoUbm0BrTndQiCTcuayy+Zc7ggn4NLw4hiJIKg
	E8tjhbaYdByQGibFkPFlxv8nL6CctJLgvfY97u0es89vpjx521zZ9HNlwbBOcx2H
	wG416p6VnC7cn/6Lx8yWzb51ec0nIAIx2s3NUJnvOE1+QanhaVNegDjwalSjsG/3
	/rKhSU46tHh5z88NAtYnBg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1n8bwft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:15:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HL22TB024957
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:15:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbgg221-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye7+j90qemqEATFJsrSKe+2Ih1pURFnwQQLNcgk0aczzZQdeEuMa4qHiBEqnqq5XcNWyjkEUIFILJnFDmarSCjYKZh0QG+Wvv41R4brd1TcgSuFTrpLmbq2IDJYbh3ozGaaKDK6hef9X30YC21m2hUhNK3WyLYiuulXirXKY6RPKx+aet/Jg060WVcj2RVkySQAqOJkOzeiWAsvaPU/O8fSzDXWYgIAMDion9a6n6gYz9YbfGd/Tu+2i1FUvylOy8V09SCCAjJkLE0K+CkD3fVJYaqwDfNapBL5GfgjyRp7vEarikheCupgU2iseJIWwJL/VJJxHL8AHTleQBNkZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmVo4ko7JTyK62uxwkkRyahE7w7CvV2zuKJvhse5vWk=;
 b=Wuu3maX/nNnE93Oi/lOHhzu0T0N8ZYfNPHXMHlCnZx+D8y+QYwN+DU9iFWAIZd+Q8k1NhRh0k5GOjQXcOtx22wd6EJEkFC+0cI/fdFR6ov3iX3WoiiClQ5o1fS6NPp4f1yYbgUuneoZ2VUOreCvbwt51O92Cnq+gUt6CCIpgfKJtkiH1VbycD4JkvrlUiogEvrwPYlPvMDtl1sdPVneB5MmjH262QhBacXFgps6c4nUTAzK/PmfQKNsq2NMEk55j3zAdV3uQ+Yy2qsX37h4/AoA4eqjeus2PSjRFeaJRWcjn3SjBGOw5MgXWai+TkQjALvBHGqhEGxdxdZL6VvPvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmVo4ko7JTyK62uxwkkRyahE7w7CvV2zuKJvhse5vWk=;
 b=i5dZM8sgT1pobTeQ8Sc7zg9WlCQK/RtCfOmxpj5zKRrGsqfyv/220arDU5dZ56AiZufbreQHa5Y6gEcGfaeRy0bLsg4PO9VryIGwWd9DgBciUdtHVu4pRQGkev48J23luDVfywgdxUMin5xb+pmQMGe16f2ju0oFukD/8+OoNdM=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB5139.namprd10.prod.outlook.com (2603:10b6:208:307::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 21:15:56 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 21:15:56 +0000
Date: Mon, 17 Mar 2025 17:15:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/8] fbt: performance improvements
Message-ID: <Z9iRCQsY5iJi1VzQ@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-5-kris.van.hees@oracle.com>
 <a7159b93-884b-9911-b736-f500b3b8a6de@oracle.com>
 <Z9EcukBSIMGcxe8Q@oracle.com>
 <a919bbe3-db2b-5109-a6cb-e7a2745e41b5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a919bbe3-db2b-5109-a6cb-e7a2745e41b5@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: f138d11e-b2cd-4644-9cc3-08dd6598e848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?bvJA4PeGLKNT4cbdT1H4z45UbAi73GqHRYYJvjuXIHz/CGCYYARoLokm2J?=
 =?iso-8859-1?Q?1DHtV9Zbjni3+EzoeqyzZ9PD0Qmx1Sry9sA/oA2/K+Bq8pgNxE2xYBtarB?=
 =?iso-8859-1?Q?rNyfxt9yIwoRNBHtYM5MNIzgOS9RLQyeVCfvLD1uxy7g8J2rOxwwIMc4cJ?=
 =?iso-8859-1?Q?Mqi401RW5Ghg2SSzM3r/jwQqvPgKmy+MXzdENXrP6CQGIRDK2pPGyGswwd?=
 =?iso-8859-1?Q?sk8yAQ94k8wzy7xB3KM7FoHls+z+1Zscl+DiYHE5hEsAb8KXMm4/0Ba2NG?=
 =?iso-8859-1?Q?kRVUGohCRh2Rb6VTgUTm2FgVokXzMRX1mCE+w806KxfH2fAAyJDIkweOBz?=
 =?iso-8859-1?Q?bqyHOfH65iuM370umX+xwaH1OU8gJjARXQBXMC0pf9Cpi0yj2aiA4uHlod?=
 =?iso-8859-1?Q?T01JXBg0EfFsXTRrEvpqEngziEPJJ+4VrEx5Bhvhlr0OagZJpu9eCulyiT?=
 =?iso-8859-1?Q?1o7GHkInvpXGMatZLg6DiUNnQViFxhJ1ydttcaGF7iMSZB+y4XWXISLEpa?=
 =?iso-8859-1?Q?nzN0guOmRfdo85Zidp0at46QnceDZ1rj2VqwM9epXlXCtlQW6zbEDssoX0?=
 =?iso-8859-1?Q?wpqquUuSl+qDUDO/g7kS4iTen0Wy0BFKFQr5E4e20H2dZCz50N5imtoHIn?=
 =?iso-8859-1?Q?qh/SB/UddQTI1zKmuUGT3vchXB4jGyfD5NcF1DlJOKgshpagmUlHKjMLJD?=
 =?iso-8859-1?Q?K23jNJeJ0Wyq3E1kMgLPh/yOpFOdoC+To6VjWEcPrreNjHvLnstM2tqO4x?=
 =?iso-8859-1?Q?2846Teq9CTE413TrV7K8wyIOe/5xYwav0/Roj0U+ZUCpQZ1DP1IVdsEAHj?=
 =?iso-8859-1?Q?8uXihXhc2/ig9IfdApJ/GpZPg+7nWZlyVEVxB+SbzGlDYmhAyLVhFvy2Pn?=
 =?iso-8859-1?Q?0JfuCWM/1NRis67v1EIe/0DZsv+goNSO5ugMMeU8s3zaLByl2weHjFzjTx?=
 =?iso-8859-1?Q?sA61mRFnoZJddtqEY+6i2FCCrq3CWnGfk8DIY0odBqqDxLX/Aig0rUIt+0?=
 =?iso-8859-1?Q?b7rJNTHl8rqZ9becL6YHo5Vs+hkJxS/btJ3dZkLDyN/fEI4F7GOuTe+cZt?=
 =?iso-8859-1?Q?h9xRyNBrRpDdsFDSE8MSYCsHJ78n44uCWcX68udCiCu6SzZ/e0FcsNIVVq?=
 =?iso-8859-1?Q?D6PO1vzuEX2Tipzm5dJX1TCrF27qYmvJ2NPQuEK1Q3jfk+xtqjdFqBdFTR?=
 =?iso-8859-1?Q?6w052rWta2EKuDEPtYq3kylfa5TpwDqiNYnLQtBMXclqvcRose1yAweGfJ?=
 =?iso-8859-1?Q?PlS2A1QMBNo62pwCg3QU6RQqHMzY+J9+a9OjaEHjsUsaXiy9A4k/gYUKt/?=
 =?iso-8859-1?Q?2eI5Do/KQHYdjNhiX6hWhnzQP6jHxLSKOCwG2VmrvTnEiYwadtIHA01GD1?=
 =?iso-8859-1?Q?p1XbOf4iREjLs4yOWWd5qR4uAWkWRUl0wPeYEwbCrnA0XXyb6s2usafj3h?=
 =?iso-8859-1?Q?45pvyDV4DDB5RV4Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qtUCmAO1LgBM19o/ISc+mVs8C1mPsOBFIj7OnHPQeTdf6ZWNHgDqPb/NEu?=
 =?iso-8859-1?Q?pG+ur/30MZCuYacRemjxTxVdnSX4VQhiwzYm7Ihm06OLvbFmNgN00gmkir?=
 =?iso-8859-1?Q?agdzT0y+jkdS6ivZoM0/sjzwNbUH+J/R/ULDE5K3kOkxrzHjAXmvWUMabN?=
 =?iso-8859-1?Q?9bV7au9FrlmLqjgo7cjtUh5nuUAKfl/83UiIEI/xwpjZN+RdEAj15j0X14?=
 =?iso-8859-1?Q?COGhrp9n37QttvG9ngfUvEWXTQsA93sUsmzj4KWyTusJjHJHPCP1ycyI+d?=
 =?iso-8859-1?Q?oU1ndXxudt9CCppQlYmKhf73HIcmJGor99h2JT9GXXZGLrBiFQKLRd3RRz?=
 =?iso-8859-1?Q?+dmaZLDaIUZWzrqURaZchz+7q60lFGbJgfjq48Ypl7+TSyKw/mOmKmR4Sa?=
 =?iso-8859-1?Q?7NwqjjgNvJcXLafVFoZJwqn9uN0kFMS397RxIdJMVxCT/X3ElfX6cMxG2K?=
 =?iso-8859-1?Q?81SlrpXN+w6P6HMFWiCFAPKjopE3Jk2YijJVyhw1qMMGqiB7ayWBUXibtj?=
 =?iso-8859-1?Q?DU95CWrep6tJQXSXCvvla8vpZ8wxFQBTZyPQX30fMEi2XCvB/Y1ltzcVtW?=
 =?iso-8859-1?Q?mU4ebiqHMisJ+GFKxqPW/bWd5WSzw92GF/MaOlF5bKrnbjgG59A9R4kP1Q?=
 =?iso-8859-1?Q?Xu3po1tetiBTHzx3wz0t0NsaUZB1Q/0M6il39YB5jfBZmXszvfJLccbu6b?=
 =?iso-8859-1?Q?Qj2SDZ9TwwRFjaRtgqf1K/nGhKVpg9ywRZIQdD7CYjZCkzks7K2HqJPhl9?=
 =?iso-8859-1?Q?S4ox5jUtzE6JlpAhp7f2NV+pkgadZatbsPU7yhLo5/R8Ik9kuLX9XgKXIK?=
 =?iso-8859-1?Q?+wdFIajTC2TZVtAJjkIdzfEGrJMsTXsTe2p6GrPoQkb/zUeMgOLyB/uAmf?=
 =?iso-8859-1?Q?a4uzOlilyk3cPCa6McbENDN7WaHin2Q68+LZM3/RREXb1LM5UQtrUEnwPx?=
 =?iso-8859-1?Q?E1PDfhNG/DuA6ZbRDZPSF9TY0fvrpfslCIHwZPyH9f89hqoCGQTmsLuaAg?=
 =?iso-8859-1?Q?srFl7nfpLeF3pLEj26BsWhThw9iBkianVTij7FhEcFcYnwP8eyOnFxU5Et?=
 =?iso-8859-1?Q?ZLVvkk7TY1Q8h1I58bIjjNcb+MkZFItVatPfGWFT4GWnBywTC0CpJympjm?=
 =?iso-8859-1?Q?kG4tuW3aNZofzuvMXkavrQKhFU0/+kKTieB7rwj6bQOUP5gQUrrZvi/MJv?=
 =?iso-8859-1?Q?DcB7TER8zFxWDF52L6FKzNJNZA8IcdMlZEOKPYv8m0gCXPFajhg7o7G3cg?=
 =?iso-8859-1?Q?6CSNJwMC/jifPwKFeAg53FLWqjG40ZiVfDksfVIk9caUvsHv1ri/qH0eeq?=
 =?iso-8859-1?Q?pWWmbW+1wTCEMwOzfZ55i6d5w45vwMQJhDr4lYmjp7GCTQoKA1VO4l4Do3?=
 =?iso-8859-1?Q?XBiQtYwIZ/i+U1XdwqC6Z3nHU9f4SMTv+s5VIjhbzxeysZWDB/pm1/4YNM?=
 =?iso-8859-1?Q?V3K1/DTZT8yKh7a6J3nJDWrPGQi6iRAboKj2PyD3OtV0f8Ceug+u8gVUl+?=
 =?iso-8859-1?Q?hd8ldAbnVo99KiN9T3R8JQMZu87TVkyclTjs2pr3fth63CPSAEhfWZRhAw?=
 =?iso-8859-1?Q?teslMBO8uVVrExB7iSyOB1xvY9CMLZowZ03EyVusIz47pgetj8cxWHExvn?=
 =?iso-8859-1?Q?eFpeu9aG3BOfa4JEz+Sq46m4SzF9I+UdhYXrlUk7e3u/17UjdkVvxQzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	452d/Wf3dzIfqjQ0yr8en7kjEyWcCXVTSuBNzVcgR98DX04Km8OMh9rMhoxEX9WJVPon6vP8xkN3GkxwrJtEe/gNrnUIFf6o0xRU13ySL3Ej9ip0WTTCfFwPZ3AqXvjYI9Q6bKiuR2YkhysbDJCVbvls7kkRO34l6kWXU0BTOljGpW4Vk8t9oqSdkr4e45AKlCxVbFjNshvruAXaNTBUAvvmSVGTspC5ThpwOWJqYB34nbpSvqisc6evDXC3H5IfhI7tGKHT8fKJoBefDPiO34cIXqkD5APqGJlnEQitQsmKmZV0z/sX6sKFv44SH36IGvwrK3xHmiHeU+GqGS+7034IVJNziuvAcHDVFUyXIC233eTKrxisxtCs+nqwZyQ9ZhhiN5jalJsUZhyDygee8acMQmNZ0uJDdjwh/TEGAUlZJCLUcD4/G4BDqoJWMGacs+bkK/b8tqpIXqEKjE4M1ISE9kORjVTIJhZhPavpa2x0GIyAOE2S/EMA4iKXWilmGTZNJmxcpC4MGUf589t8T6vQqPUntkDqQZjw3i8WUgoXpUQVGl5SN0w3W7LsccEtqME/s/pSk4ePeItdd378ApP0CumtFRFDYLHjvyp4Ymc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f138d11e-b2cd-4644-9cc3-08dd6598e848
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 21:15:56.4844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYll+y5cL6w1IsrA+clqKd35nqrHl5uFKPeYmrOozxWCSrflwzmnOOisO0DHx3OcgrUm4RM9BmfEFmzVoBR8cV8xFuAThz1pFTn4ZgsBH0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=825 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503170153
X-Proofpoint-ORIG-GUID: H6oUVH4V_djO1jtnjPZviWFF5GJPLCb6
X-Proofpoint-GUID: H6oUVH4V_djO1jtnjPZviWFF5GJPLCb6

On Mon, Mar 17, 2025 at 05:00:39PM -0400, Eugene Loh wrote:
> On 3/12/25 01:33, Kris Van Hees wrote:
> 
> > No change should be needed to the lockstat provider.  You uncovered a bug
> > in my patch - I'll fix it.
> 
> Just curious why lockstat even used "_*" rather than "_slowpath".

Not sure - maybe there was another variant at some point in time that is no
longer there right now.

> > Incidentally, I also just noticed that dt_modsym_mark_traceable(dtp); is being
> > done too early.  We only really need that to be done once we get to looking at
> > function symbols.  I'll move it - that way we avoid marking function traceable
> > for probes that cannot be FBT probes because of probe name or module name.
> > 
> > I'll send out a v2 tomorrow with that fix.
> 
> Okay, I think I see v2.  Just checking:  does it indeed have
> dt_modsym_mark_traceable() moved?

No, that is being done in the consolidation patch.
