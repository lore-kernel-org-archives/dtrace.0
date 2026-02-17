Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D1271450
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346120; cv=fail; b=JzYfTV3rZuHknCPwmqbNVoK8UldJXXPeT5g+sulF8f8hWZyR8kmqGdcdbjiATltP9JkRgjefMFlRWQ5ipIZCpWyvey5Zo28H46vFEAiDDG8wMMjFJoV+Gv1QzcA7bVaQaEhXheF/Uoa1ggMFqfhlHGJ1eQP9CDssipzVMRkGKdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346120; c=relaxed/simple;
	bh=OVcTSQkh6OUBfGneTbWIicjnzujVb+qLS2Agal4cSyU=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=a49FKJvgu2Lt9Si82pqOi6SP3cM2GQxF0ypvcideyNOrW8NZOaRaCUoJyW6UUqu32+hZbEBIFFnOn0uRXS+RCErQNLNkIQf+kO+GWVH9kgc0IAmvcgdnjSefyIPGEODtYq2guOgQbpOt7kX49aoOEFdK8vJexBnOD8GpaqGEfTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTKCvVme; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e26ForQy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTKCvVme";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e26ForQy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNLFO250786
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=1tyXeo5LXsyCxPThT3p/qKYKHPEfT81eV4czs9Eg9zA=; b=
	OTKCvVmezEG5xHNyyzhXdE9aACBnnkcfu1zgOIB+4wIKcrDoJoRZOtiR1oANvDwC
	wdtLALcVCLM73wbOPc/pHbk+rHqfdm/t2R4FxOx6etb3jGLmTN+qbs7I4W5lxami
	K1pkNNdbKzk5QYRujNtcER6zYkDy3S0mJJfxYzQ+L+XwdvI2qtENwlmeFMc3iVm/
	owBeuXTFCpeVN4LQPAt40A95rQZiesKUMFzTNIodpNL/cIYZtpmB5Of42wTqEocJ
	xqna9cCyz4JxOJsaipXXe5RHbRSd9eud2mzCUsIvUCFfbEway90VI/Oa8fpEeXl0
	TLepybHgJWnCKv1U+pUx9Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0wkx23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HGDqPP026376
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:10 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb226tjc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSo9z9Er9rtWLDXrr46HY8ra5OvFBlpLtV46aFVwPawFKOfF/0SIgR7kkIhT9Lgl8SBvrit18QugnKw9Jcn87AM3plt/9nNDMlF6kgkVLd2vGqynMB1CpIwpqdWzi9qMdGwTkr1y/RrXNEekNUeknONevjMCE44Kbioasz7Il8CuKGZurVW3mg7yIZmnqhLumF5PSvARuV/RAr2flc6xuQm39nwXo7Ry7GZdZFHgOFKW/vtaZCRwVO68CqmSDNG6Wyeo2vtY/GBQ9yssg06DCmDXwJYeT2juW7pzXRyrGlzSejl8IENPFUEaeT7SyzBkYhWvetKukvXXzlu9wzjaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tyXeo5LXsyCxPThT3p/qKYKHPEfT81eV4czs9Eg9zA=;
 b=eFYzwsNTAP1LFc7E8peDpPzwSoovTY5ezSRmrDE7PBZk3W1eD3WvlhlYXLtc30FOlIn2mpbP8kEtMASXWMOx7aP36262AVMA6ok2nHguR4jUNH6sf2hwmZCj1tIaFTFz2G6Ka+nCZpc1iAzX274o0SyOJvgNOWqqlX7tvYN/iM4KsiISdDp5t22zGkdNhpLqdLT8vnR+uhdiYYzQxuJ2t+gWTfn8Hwhm5xYZaFMt9XKmsbbYxnVyohXC37q2BwRfZ/EE+TTxjUe1mgWq1I31CQu4ftCyal0KUFRAT137OBrmIYfQV668+SpsFZgDEV4ECqK+vCYfn8A2JnB5k0XwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tyXeo5LXsyCxPThT3p/qKYKHPEfT81eV4czs9Eg9zA=;
 b=e26ForQycOihlCS4ECbf+kv/Ct3q4RL3r2kYWw8Q3mHKNh2qW7/H2Egc3UTSFK2wjmKRIizygtoWKTW2kjPgEL4Wj+T6/eG6vPkEDgoA5bvMX/8Az2yHnYM9GoyZRXknMol8Ok1FY54f4Z0r1GIHCamFx+JICZbFiTkTDP34t3o=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6460.namprd10.prod.outlook.com (2603:10b6:510:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:35:07 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:35:07 +0000
Date: Tue, 17 Feb 2026 11:35:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] usdt: enforce provider name size limit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cef5a8d-2230-484f-f921-08de6e4282d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c+BQcdN2kPO7uKR+UVYWDI3G04CWyJdnVj0NAjalM+vdCSg0i9dQzmttT24M?=
 =?us-ascii?Q?339Tyndig9nYg27H5i5GFW/JZJ9v1mpni0Lnc4sQSTKAZ1eqT06CQf1XsPdM?=
 =?us-ascii?Q?zmtNDs4ORnCIkzi6a8mrYdZGcWAZ7Opq92K5nZNdHvRIKhiglksIUdnGmZ6z?=
 =?us-ascii?Q?z1K1McV1KwYlIZMZhkxqsfhheNqlXIQ8AHMevZcxZLnMKxSILL5Ra/rmiMyI?=
 =?us-ascii?Q?0r5qBPUydbCf535eCjfrEeuHvduIBYg8Hk5q2zGov62VPOR4U576tNIBx+s5?=
 =?us-ascii?Q?n89W8t3zqD/ABOajLQOCjYH95WKP3K4mF7RXTDlkeObSFRH+q3Lj7ZumJZBM?=
 =?us-ascii?Q?kw58JfukS8rxZWumBGVhGCOcqSjDfdRg2Q62l1CuHWuY8Dch3V+y1vbNLaql?=
 =?us-ascii?Q?C9dFwHV09jE/HBvxtZfXIQ547JgpEj3LJxhx2Dum4reLEbMy2Tw21NAZ+f2K?=
 =?us-ascii?Q?x4o54ZTgGZ8C/dFEadFSCE1zYYdm2GWGwryBkcHonvYgKdYDN+WQseon/shl?=
 =?us-ascii?Q?jeih3P45gHRHNzq193n4z6xnVvWrwLekruqBvn84Gdnx8wG4xaR4WpvRo6po?=
 =?us-ascii?Q?UvRxgVvDqkeNonYO8LCKXkPca8zVE/C2rGcFO/c3jPHmVZ9Y1HzaTyTAy9hz?=
 =?us-ascii?Q?mNUCncXZp5TOMqVGl6VO5jy4rnSdTaTnlG6GSWPgIayR+R1evMdfu0pfdNNj?=
 =?us-ascii?Q?AyvP0YBHpcFpnjgLetUjc+EzpwdzQMLRlQXZTpjdOMyMLQ7fVD5T+SF0ni1l?=
 =?us-ascii?Q?Im1UzbELTeDYK4BKI6Vnfj4jqIO13/qreHG8/4NVqM/z1oc198ugP/0dDvz/?=
 =?us-ascii?Q?QXOoP/mJFeO31qGpKNViTYREYCYLu8aLpUMykjym+j6J/kZrmhHnd7RrEytB?=
 =?us-ascii?Q?7E9W/3ekq32RhrqEl4D73GVW1tonv/NzbqnitqpO28Z1/Ga7Pp9tWQn8SHWS?=
 =?us-ascii?Q?lYm9SemDYbWVkaLoBEzrl+HmrsvEEBrRk/sZduHEIUThJnbVun/IMoLW0MeB?=
 =?us-ascii?Q?gbs/nWQlta7UweLNPlG1NYPPaZ5Cxa3fi8uOYZGVC5kco32VONQAuiBLODB9?=
 =?us-ascii?Q?iUh0IMWd+cIqeCu6Mk3zx8VTGCCdjyBWeeh9pYohWO9IJT0HvN5+dynuWH+H?=
 =?us-ascii?Q?E5whfOyR7fUISL9fmTo2hIyS1TdVRB+i/+17A1tauiSC59rJ4DM2AmzHCZBV?=
 =?us-ascii?Q?tPAK53vLfPq70z4GnY7HpwhGPtMve0NVLADLM4DhNdWP1FaHyehdQ/9lzf9k?=
 =?us-ascii?Q?6G9KQIbJ7FNKXxpTnTyJQRAobwe1H/d6kikLFUCFidqEqhArM8o1KP2vtbCT?=
 =?us-ascii?Q?FlS90ekLeoIZhSWFRCw8FtQFuWlFLwRZEEH6WiokLTTnf3MkN3qXStwZHQD/?=
 =?us-ascii?Q?ewWKgap7uLeVNLjmvHm0WyqlMqR5KzyPKMLpPIcgFQskeagDpwCizKlfk3AF?=
 =?us-ascii?Q?BHjR6w+CR1kW+8kXTwIc1255TLHd8PQ8BxTmFHf/oGQSVLkN8T7Oi4VJkRaX?=
 =?us-ascii?Q?n55dk64+KoiN8uUmvUJ7bExD35yOevJ44Xdj7/9qY2Mi5JYYwB8sa3iqSx+2?=
 =?us-ascii?Q?DwM3GMakiD7+RYlQlI0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rlX1ucIzf7wcVevcQ9UatmUs0sbu8MIhNAanQQ0XWYzuIsfqSOPYU0h3yOUp?=
 =?us-ascii?Q?XzFaxI098QXnqVXi+etVkDIs9jaY21JtnhwJf8AA+Q553AV48XbR8Kgpr1gm?=
 =?us-ascii?Q?Gp2heqoEHcB11K6N3AYBPjK8JsxSkPPPcOZA/lF9NnqgAh2+8jDxxHgCH72r?=
 =?us-ascii?Q?2+ljsxJSd8SmBmK8LRT5uFkR+v0XSN6sFjZu+6kCxfy/3XHSdXjYtsv0YKqF?=
 =?us-ascii?Q?kLJGs42h4elkK8apxmO6U6S8xgoYqWSKY7Ie3opJJ6KHtkcpOdHw/x+CaPbM?=
 =?us-ascii?Q?uER5sobhJ9P+q9F9ycUCW3EmiMFW07Cclzv37lAklkqRe81VMaAEp7j5IAko?=
 =?us-ascii?Q?e56P5e/Wp9ngHOwTn7u2jQUwngZwe5vnGwOdWVR2PVvUUDLs6gVnpWrM4BeP?=
 =?us-ascii?Q?QM1/Rt7alZb9tmVcu5tY2m7o2wGLBBGQWsMkL7hfPOGigKHfSlz7Yps86sn3?=
 =?us-ascii?Q?46N/Rp7no6cQpTcbC05m74eyEvmGyN7beJimf0mtg3dhIOC+6ynmWjJg0itE?=
 =?us-ascii?Q?I2lNoriNdCd4gFAz+ADT52bLkhh43znIPsoQR0VUWeX5T+jezOGvKlqZ1Pzl?=
 =?us-ascii?Q?uvcD8gcxK9qGgCKUEKfAnxcNRIaZahAbbfpRFCS548fgbtdqhiX0DM/pYmxG?=
 =?us-ascii?Q?+x6ACu9NwiQ2CdUtlh7A09TMrx5kgCHxzI8pGFPLSdK4LppariG0ZV54J7yV?=
 =?us-ascii?Q?ntHml2XUCyc2wZKpTh08DvVphzhU82itvClJtJOYiv4VaTBVXd4Vu3Zy1I8R?=
 =?us-ascii?Q?DL+YvDFzpGT+Yi1ZcwrH6JlXxJycNjprCf5YaAGzMFEmNzWc44BAroZCTh8w?=
 =?us-ascii?Q?P7VVn0Tw8xKGh9tKf+k5N4Na+pRlwAg0h0hjrLr7OdJPZ5TJ32vTLT+rBQMe?=
 =?us-ascii?Q?15g/GngNPazmqwnFcN6jbpgJgGKDeNnACqBQFbs9makCZ++ZBfELRh3664eY?=
 =?us-ascii?Q?B7ElmHXaDDM4o9TONQ+YPDKuk5Z9jNamA7gZ9JSsjSoPDVmtEIfckZepXobA?=
 =?us-ascii?Q?Xi0PkLUM179s6RdG8RXmbSKqYMrl0uDYQKc56NO8ERJywnqKRWghgsvz0auj?=
 =?us-ascii?Q?FYKOvrMtKZf+YkWNyeLLOV9Hotbx6ICO56SPx+V137JOZOoDQJUjuYxxnVSQ?=
 =?us-ascii?Q?Y8sv18qL6S4yO0Ggk8vI0IdANwTgkN+OTrppQC6Ot/Wh1y24EX342u5hYUsR?=
 =?us-ascii?Q?MxmXl8KYRm62bahnsDZSTVFtctdqNigFKclaID5Q/bH7XKbhESXD41hs6JAo?=
 =?us-ascii?Q?g3eYpheapeXBcmAX0lTByslo+eTe83fJE/fFUOb7J3maH02mBCTiEDb1FEd/?=
 =?us-ascii?Q?htruiPadYVJFydvPWwA9wM+LDSeV6Q+pEpplK6QJJws0iyr54v49NQtOD5c2?=
 =?us-ascii?Q?EHxD2Na+dHRei/jV41pV9eZiBSfJVBmjtmShzZiR+oyRK9Wn0HU8mOgjO1lp?=
 =?us-ascii?Q?oZ+uyijxjVnyhG2VXYOMOX9UxScL6MzHrXEPZG4T7S8UevcIdiINUcICJUso?=
 =?us-ascii?Q?78BaLgisateWt2PhmV83JXEX0GoLpcHLJCDg6i5oTKxVKbTrBwWZZ5YCHjdw?=
 =?us-ascii?Q?V19mXTTjrPpHNcxwhORVD1S9LXZOmCYMqzqCKDWa1woNyDwmXaY17X7Cs7rB?=
 =?us-ascii?Q?nl8V6nm/OapgiqXER/nnch+M93UC7VjT1+WIxADGS0vYJqzMLLPc4Q/s0z0i?=
 =?us-ascii?Q?2gu2xYwWQLyV4W49aINrEaSdBZBWrHF6shuwGkEAcwrnGvharrPxfsSNaumM?=
 =?us-ascii?Q?4CEl89LR3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f+4rOdZ57HyEUaTzof+veNTkIoFeNELEdjkrvqrnm6GQVurgFVpLrcJ+uWFN9MMh0mS9hVy31781egif0hfGzy5lD5Gx+IXD/66PVMQCHNmvs6bnneI+QYIg9qKuGXrEFZuFcKVw8JhazN7IGWOYqTOuaOksx/71gXxB0SUqLJt+GyBEoxlpHXLH0+bS5Xy9XiVjCKkW7mduzId5fZ5sfkBj9HqIHtn2mDifNlZ02PwGMP5Iie1ybx9vCzHBrEHoyJ8/28jqvn8KfggkoH3zaEtKJnH29Safz9M37qcWC17FcioUWehmm37ehCL1bVgDlwZ3JeVnYB2aF7WRpc49t5VXvPybLrs74kjAv/fhZpF2gBGq+CfTeoZ8O7CUZZHeg69lbujOMPwfMwxe7SQLT4YvDRPy9tSDnG9nDkL+wcJXt8wfL2hVx6Yub6mtKW6M38rox1PSwR5yY6tm1KB4xXLFEMGxF6/c0N4GiP/6YuWyq0t/dY3cizQV9ybf0WQWZtBfJC8Ip7P70FFkTnPKOTiae8DPDHtRdM7MqFGuYXaEWsgmvm0OGKx3lrd/7G2nRcuAt9TGLvhSp9wr87NigyEq022XEbVLOk6nW+VNIeo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cef5a8d-2230-484f-f921-08de6e4282d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:35:07.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sw2EBjfAYfW6P9TKMCGvvyJaZXz5GU3kRmzuF8rJSXJRm5ihS6PQejS4a2hkm4VSr59r/5mBWl0VQbbUp9jIRtqYIjbX+J+gmsJ5Ogoyqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2602170135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzNSBTYWx0ZWRfX7uZ8I3/oOFdS
 dVefFmW5Az0Szel+KHfD2ISorLF2NlY9noDko1t25dahq3+IkYvejdzikE0AiD3+Ohb+UUmN110
 vNmjOlXSmS82yw+2MnX43QY7dE34Ruguc2M+84VKjRjx0yaGFZuBMybAuiZXHRGNkDdoWC64mCT
 VS0ZaIbB2p6od3eOMCzxs2wxtgrwxXyshRhNLtE15S+JySz2hxxW0qF5o9pvQ5IONOXNXQV7O2D
 PPwFtQOTYV3XBd1lG8ngzTPuAwowxBWg4nORTzK8llzVFQ/cPETsPKLWd9JeLD8WEdCLuOVEX/N
 Gwn0IG8YBN0a4FkgFyzqrFgbDTzklzk0wdPbvD2RljLhe20IXwN5TEO/iuKV+nfNQv7RVYyg8VC
 6yGdT+y3wxDVQvLVmkzd6cZ7qq5TLjtHYBUu4mXM8RnJZh7fKmYa8XI9D32eeDcGLq9OCa2vd27
 i2x1mhsaJ8tRPYAwDMw==
X-Authority-Analysis: v=2.4 cv=ZMfaWH7b c=1 sm=1 tr=0 ts=699498bf cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=BwwVrbhTaRPK0IXjvj8A:9
X-Proofpoint-ORIG-GUID: bvN-RPVhbEOXwXt2DRkz2LIq6-9dIzGY
X-Proofpoint-GUID: bvN-RPVhbEOXwXt2DRkz2LIq6-9dIzGY

Since USDT provider names have a PID appended to them, the base provider
name cannot be longer than 53 characters (PID can take up to 10 chars).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_link.c                     | 24 ++++++++++++---
 test/unittest/usdt/err.prov-too-long.r  |  3 ++
 test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 5 deletions(-)
 create mode 100644 test/unittest/usdt/err.prov-too-long.r
 create mode 100755 test/unittest/usdt/err.prov-too-long.sh

diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index ffa16d9a..e77f06f7 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
 	usdt->base = ALIGN(usdt->base + usdt->size, 4);
 	usdt->size = 0;
 
+	/* Ensure there is enough space in the provider name for the PID. */
 	len = strlen(pvp->desc.dtvd_name);
+	if (len > DTRACE_PROVNAMELEN - 10 - 1)
+		return dt_link_error(usdt->dtp, NULL, -1,
+				     "USDT provider name may not exceed %d "
+				     "characters: %s\n",
+				     DTRACE_PROVNAMELEN - 11,
+				     pvp->desc.dtvd_name);
+
 	sz = PROV_NOTE_HEADSZ +
 	     ALIGN(len + 1, 4) +	/* provider name */
 	     6 * sizeof(uint32_t);	/* stability attributes */
@@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
 	shdr->sh_addralign = sizeof(char);
 
 	/* Add the provider definitions. */
-	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
-		note_add_provider(usdt, pvp);
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
+		if (note_add_provider(usdt, pvp) == -1)
+			goto fail;
+	}
 
 	if (!(flags & DTRACE_D_STRIP)) {
-		note_add_version(usdt);
-		note_add_utsname(usdt);
+		if (note_add_version(usdt) == -1)
+			goto fail;
+		if (note_add_utsname(usdt) == -1)
+			goto fail;
 	}
 
 	dt_free(dtp, usdt);
@@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	if (!dtp->dt_lazyload)
 		unlink(file);
 
-	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
+	ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
+	if (ret == -1)
+		goto done;
 
 	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
 		return dt_link_error(dtp, NULL, -1,
diff --git a/test/unittest/usdt/err.prov-too-long.r b/test/unittest/usdt/err.prov-too-long.r
new file mode 100644
index 00000000..1305f434
--- /dev/null
+++ b/test/unittest/usdt/err.prov-too-long.r
@@ -0,0 +1,3 @@
+-- @@stderr --
+dtrace: failed to link script prov: USDT provider name may not exceed 53 characters: test_12345678901234567890123456789012345678901234_prov
+failed to create DOF
diff --git a/test/unittest/usdt/err.prov-too-long.sh b/test/unittest/usdt/err.prov-too-long.sh
new file mode 100755
index 00000000..599e461e
--- /dev/null
+++ b/test/unittest/usdt/err.prov-too-long.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# Ensure that provider names longer than 53 chars are rejected at link time.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+
+dtrace=$1
+
+DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+/* Provider name is 53 chars long */
+provider test_1234567890123456789012345678901234567890123_prov {
+	probe go();
+};
+/* Provider name is 54 chars long */
+provider test_12345678901234567890123456789012345678901234_prov {
+	probe go();
+};
+EOF
+
+$dtrace $dt_flags -G -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+
+echo "DOF creation should have failed" >& 2
+exit 0
-- 
2.51.0

