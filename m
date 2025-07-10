Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64212FD5B6
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752178383; cv=fail; b=PcLfDNgQJyG+My+x8cgSITgLfn46NK27Pne4LQeXeIHsLtVeQBytwVC9lI63tqWis6CMrHYHhNcoHimFVUkuUqV9tvryQZ/jiaECiwYHvrREyY+qL1o0FIWG9uZfiNTlrJ4uFr1HbFGKDvmJhC6sQz+qoAFSWQO6Fj+KBh5UDOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752178383; c=relaxed/simple;
	bh=0COz9dZSvrXN5sqUwAdXy91K6C7ng1gW8Z16l0MaOio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=stxcjQloz2NEookCumg3K9Mqho0sqD5zsJMHhtW33m/1BBgkRMuNgWdoyxK2s0WPE4A5JKAKQ00yGFHK3EHKB1G1+72XhvxWsxgjTckNtSKSIFVkg8nDqMPXeqQNwUrUS+YqIQnXj6iA1IUIP+8mixk5/EwXwGrwQEjqsOKailg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KrJWlAa5; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UlR2V4qx reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KrJWlAa5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UlR2V4qx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AHYxZx003038
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vDWidpThZo2gnaU2qZSz+vNyecN7vSQLDXcpFhxG6lY=; b=
	KrJWlAa5u9tQUcfaLVihHCXqy9eRvX+WHk2dzSXXgHDfW4aQA7ZoeUiIZjoUJY6k
	nrhBnWyMWNo29XGF1S5Y8lF2PBn2gAQH+NZy42hIKpdT0taPGJwd4sUPzBNtIIVb
	o55khOnHitmflyDgIjPLYDeFjyGoPLCBHq+qJ3zBHQnN2jvJsKxJPVSLAwSvFluY
	RYqBsVIAKoOYkwNKSlWkn5YMbvc7Q/YJueLRBJXGC23CLDNdtHG00p9fgx/LvyGV
	06/BLxPuBS61/wFfo/chdx4bpZwn9Ep2P1EvPEUc0SahaVW0WBIYM4LMJoDe1vlv
	/OtOrwLs5e6t1kMtXd+0Vw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tgym0era-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:13:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJWsM0013551
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:12:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdheeb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKzypQ08Svh78p8kjWR+CKbP/8B3n24rGIuWQ+CoQ46lB5ZksbiXrkOIjSvi/qICUYG38ZOOHC7PGBvHkDcTF9m7cLyoIf/Uv8bbz9xNhdOFv1Ln6YzekLZzL/tEU4YQnj4ShHZ9NCoEJl5bGUzh6OxojFDiLHo/QRWyE04A1dUhfSQFXR4mW7ZuiuitXqacOxC8kTxVxFEJM0uML5Yy1r3mw5kZr16X9d7uwJQaylKV2XtkpmpFc5r5XtNBQWXVnJ/nKN6/h7iyDwpUMG83E2Zdy2RjyhpWlbhjGyocRyY1hpFNHIoTPiNXWS4G1S2ccR30Yc7E2IG5vT4RTurOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCY8DQ1h1GFHFdibWrz3QuMlw3VNpihUmL93SVZnfyw=;
 b=kicKml5QeivtGeSsM89/csm7aAwwiaKFivUfvUYl4Ht7bJeudHWmXzUxsKbvyk76VbsSySLJQXcmjCjZ336n/EROOh0ITim5llly0xj+Qf1LCCtHLBaHDJoMJylzQbEu0to8ZADQvUeuleXDM8jS5CLy8c0xc/UsFfsU3Wsv2pykhXhVX2V8tQeOo66N7EjnURp6rhW+UEFPX4yGEgRENLcy357gdCLqtvn7Zbex9pdfkC/MpjSK8sShwbzPU78K6sEN9uNv3t5RHD+/lRxQ4SR0F2OazrgP1Ae30ybr9OTYoi7UrWDE3HRjRuAC0SbaGxm6hmfnC84zTe3je0kKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCY8DQ1h1GFHFdibWrz3QuMlw3VNpihUmL93SVZnfyw=;
 b=UlR2V4qxegMtZblhEXzO+mL43sM+UXR52adeLysZiwetwzdaNQAgiMwk4F0kXKCHBCir3h65lZAO9NMthoXAhFbZkUlEKH960XctRl7+qqckFgAmWmmuOWEg610SPPdHoWckZQvqB/1OZet5FdPOHv6ZuFSDM+TgqUIhvqJ9iBM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV3PR10MB7984.namprd10.prod.outlook.com (2603:10b6:408:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 20:12:56 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 10 Jul 2025
 20:12:56 +0000
Date: Thu, 10 Jul 2025 16:12:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
Message-ID: <aHAexDy7Xp46/fES@oracle.com>
References: <20250708045257.13808-1-eugene.loh@oracle.com>
 <87ldoyev5f.fsf@esperi.org.uk>
 <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
 <aG7/DBUnMDy1PVVS@oracle.com>
 <1333109c-48bd-8e96-b16f-0d264c950e04@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1333109c-48bd-8e96-b16f-0d264c950e04@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV3PR10MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 366de00f-c293-4681-5bf5-08ddbfee2881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?KHrSHTUDXZuRDe8B1e4MedWO76xvB/x4YalpfMv+GB7ned6Fh+oR4f/aeO?=
 =?iso-8859-1?Q?nK38C7AjO0tK2B/CJ2CVVcvBq9a/+IfziYAmfYppjc3SoucX+RzP3nY/Ud?=
 =?iso-8859-1?Q?TgH9N1xEigrfWRtT3lgaQjPhXjSdIJTjOS4VTj/MQ+5JOPCh9anRSYEdA5?=
 =?iso-8859-1?Q?VZIHiEqHBU1ADKwXCyxQmDqFnvJtiU9708RUALZiDTY7hX6PLZ0W4X5k1N?=
 =?iso-8859-1?Q?TToveeED7cs2RfGZ9Rg172TdUWQTBHbfV9yN8Zmp+agodqVzyusgFlNqqn?=
 =?iso-8859-1?Q?xFceHwf8LiNgipH/WMybmrb/asRy6wf/BZx8KBIYERvA4FPWJxJdYLNV12?=
 =?iso-8859-1?Q?KGrmbVI933p7H4CFrygmXGtaZ2gHEZ5MQAdUCd6aDSR5eerlWoig2P9Wja?=
 =?iso-8859-1?Q?1yYamgOjXle6Y1rI902soMgoO5PmcCblmi8SdJoOev8EAd6JF6hPTXykm4?=
 =?iso-8859-1?Q?T4Dpm1+OLuYtilk1QIds7ZZSlWeKm/prs51vh/zfSn9CDsUymlwQqkdpS4?=
 =?iso-8859-1?Q?M/Jh/ny7ymfgTL04At+omavD+IXoSV0p4A2RL902WatVD7+CgHn2y/psGl?=
 =?iso-8859-1?Q?l1TNS0F1ykzEH34a935dD+z/pWtDoAZA+KRNExigA5X9FRWL1VqDDbK4S1?=
 =?iso-8859-1?Q?durwNWYfSKvOXw9BcvzLZ/Qj9CdcxGkyvLssI6qyV8/FhR3UcEOx+072Ts?=
 =?iso-8859-1?Q?VfKsSUZ9wwqycYmsrZntRf+MaLv2t53Sc/UjY03ljkb1Mziwmxmg6kqeGa?=
 =?iso-8859-1?Q?n32CKkH6OYcqZJbnmlgKy/uWF27hiqVxku9UrGNNLlT71SwUij1Uk0Fffn?=
 =?iso-8859-1?Q?kqgvyMo0dw4NhagetHgbfuwzCRdv1+YHM43OXurvHz8Z7uGa1HZtMeFor7?=
 =?iso-8859-1?Q?Zf3AK23Q0kX86N3xYkCY5m5QvWSek7ThmnU6APtqDn8tRZms9esMjQXBkK?=
 =?iso-8859-1?Q?GMzL8piQk2adZV7WkEAtMH4sLVMWZlRyr5xjxv/40usaDEoMYEGQWk97sf?=
 =?iso-8859-1?Q?a8BQZWzgHpWfyeBEzmiqZkAzLBjgpLt3/0UYUD42jTySCGi3czguA2RzsH?=
 =?iso-8859-1?Q?93SRTdybijpZOzgvW4NZG5tMJiu0w2apqVBA/wjSdZ27sscrfqenZBa9xx?=
 =?iso-8859-1?Q?/l0IqXVImY7ty5Sbsiti1Y8DkamfsrVdfV/GWRywRKguOtRC43wge3uL4h?=
 =?iso-8859-1?Q?9UwzFkS4ucpB4LaUOmWMMlevCdtcTfQLaVbLpkkEA/iRD9xU7E3/c5bhXt?=
 =?iso-8859-1?Q?U2xNwjY3pO/eHOeP+4ytraIDWqkUeVOM5H3xwN4kgsDUtLeUG3pr4kvWT1?=
 =?iso-8859-1?Q?ynMBsGsW/kBy4CA2IdaBR19ehcpdOJNXv0vzEP5lVA/soOrsOOJpGKpEfi?=
 =?iso-8859-1?Q?b2X7EnPecdSMm8A382CChmkOl5/do0naYMG4Dj2kFNsyMuFvR7P9FwkwO9?=
 =?iso-8859-1?Q?BQwLdOJsDzMPRFfqfp+LGGUus9oVxiKlTy+td4PaHaR3zCExWL9wFzNig8?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8o6NKm3cp/yEWxDGbyukzuHh15JksvFPEJqu6HSiy5McX7QZ1xAkXTCEtq?=
 =?iso-8859-1?Q?4QO/s2M8yao+fQyYV9QN+7pRMWbOO+dVDnExEYAbACJpDkzNU2oSYaW13m?=
 =?iso-8859-1?Q?vGsZQKGbViXkoUYFBV6fHCAY0zj9nhMWlkZesrO7p03xuh/u/uXj+jpqpC?=
 =?iso-8859-1?Q?G9/sbW6pYMiRHtgFGyGvHDpgEzFXT+VkLGMdJSmde2ck6Du7hKjOY1Enmg?=
 =?iso-8859-1?Q?4N7iFMjbRBL867smW2ESlnBgwrw0nlqkOjRTZXJOzSHxWnoTgT5QZw1coy?=
 =?iso-8859-1?Q?P8mMZI2zQ7YV4uGnz7GzrSi2axbZp0+oixEPK9aOoGvNKWLKDqGeD5v5+2?=
 =?iso-8859-1?Q?Tw0pi4PBdzbrBksP1ZsTTWCxUiGyLRxaaCQZrAU4OVY6PZQoFLISarAGk1?=
 =?iso-8859-1?Q?dVp0/mSUc554SyHh6M49S0mbZaji+hmJIQAqODzdZB2XofwiQ3QCQnkMMZ?=
 =?iso-8859-1?Q?NMDln1lmYxo6h/bghM3YiqPEPCqD+0NKEXvTGIedBkMFnsMl8kQIRUgD0f?=
 =?iso-8859-1?Q?FvtSDtxfv0nXhqAJbiV0q235gbTktijJrxijDLfLdpSgLn/UrLrDNSgsmZ?=
 =?iso-8859-1?Q?7LwVYDlXwsGlkkduTTJnLzwItBDZPcRzWydWwUoOTvMIWigYt1p6tHtUP8?=
 =?iso-8859-1?Q?xCfDHXpGTp8obQRRzLSChO36u6xUgAcKlbS1bQ8jU9kGB1K7GnWn8APZZ6?=
 =?iso-8859-1?Q?ZKFl+4xZqBuKp0G1eJyZxFh8SJz5ipIywsskhjU+KUngfvhPAx0wYUF/VT?=
 =?iso-8859-1?Q?k8Qw2G3fwsLFE0CQCM8zlVNdwcrBkvOxtyvKjDWvCoitKPfg2eFNXpqpxS?=
 =?iso-8859-1?Q?Lxl4jPPqBiS16BIHWcsyBCgOSIaAmUvRujb2qU7zpM6/eDvw9oZQDbO0jV?=
 =?iso-8859-1?Q?B3Xx0ZAKFE75VainhImtS5x7zrg2mBhcSZ9a8VuHdMwWQbjNBA7O1jTVoo?=
 =?iso-8859-1?Q?ZSztLiRe6upsObO5oywnQPkXR1z5nFWUWQTofM0QDNQUsaNh04Tnp2zVcU?=
 =?iso-8859-1?Q?oB6L4pBw5YUEb2sITbNS2IFl7Swfy510M2ZbgzsBFFz88ZPq08wxicXXJz?=
 =?iso-8859-1?Q?eYJ9XGxj+9xVf8xhIVzpxj/ipyVJtVzpC4hVAMm0hAXHuPuCv+fozh1AHb?=
 =?iso-8859-1?Q?7ZlzrkYFAJWXTCfA7wZ/UntHrofHMALPM1N88iPSY5JJFWI2jjj1d9BGud?=
 =?iso-8859-1?Q?Ez3iLlRFei6NYfjoA1OJqZ4lPhW4X3iGWSPDGD3079cbSber/UAsVkVmVo?=
 =?iso-8859-1?Q?0tLsG3J6eNmFK7jPUSOQ95BipXkc4+4EEY68nVr1rJmDMLF/yfuKPbkPVb?=
 =?iso-8859-1?Q?aS8g52xd+NUmRef8EVmmVqfWQ4SSbU4b9q0rhrG/2XQCw4tU6MQIuXK0IO?=
 =?iso-8859-1?Q?K2hQ2ypSLGqMC3hnAJA4hYh1t56jrhdJ+t0v9gOfihJ69p7c4Woqx7BI6T?=
 =?iso-8859-1?Q?Ho0ur3w5GTbAItoWklZfBzSmyrfD52fn4MZNeK3hNzSu2BTkxNrgzN3AkT?=
 =?iso-8859-1?Q?SXRLeCBstVO5tmulVapwnoh3jgLg/jU1RKom1RRjqU1UT4Vj+TrNeUIdDO?=
 =?iso-8859-1?Q?3HL7hHa844MMbg5R5X78jDQMuTSGAmrqegVjbxi3A7XZ3FE//Vcn3L7oh1?=
 =?iso-8859-1?Q?E8WDhjnULauZi/B5OAa/HTaAV/EuHN5cwnMvir2QKHceaslXKLqDO9Vg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pHRKsN3tCEwksDTVjTcAfiLLqUO8Zq5kPebdFTiFPt/p6uJ/j3hQZV2UQeATN8LXq9odtQtBJQZoG3UfNg/2i61VnBTwcv/O2AUGKydE1tPXwvvE5JlnGgz/dtEHmayHC1xM04dCIcbLB2y0sR6eUGiLSXVG/idCR+q7JKtzDt+QZlRaWtCwYZdg35JAa0C1dpY1ShX1oYGCZpY6e7x8U5ISS7wO/stpt1ttFDJGxKTB9MubV15/MHYIpFSA2r3EfPH4Tw+Vj8gb5YWfP5zYbpg6iSUXHvz0Z1pWtlxERwEgt7Nqqn6dJkNVphaUPkbElz6Dwie0SPtESX7ew24xBfVUZ3LGbuwAFn9x0Wfq3PYlvtG9rCTEiOlS2oy4BxZqNvKP5vJ45tV2TXDyjWOrP0a6FiRVcc4lZZgAJX9vlcmfzz1aOfIaQXWISyDP9x8Q5YdI3CG2Ch3Q+hDvmpV+42T5iI4GOszrQUjnyjoPyph7z01DL3vKRjpvpJX8kryfNVoeAB7AXcDpKoQY+6+b5WVK7N5q0kOLpnw6sCeuO6Yy05IjRD/zl6HzAZM4+xcPNFnoeHkP4YIxZO2S3jk+6cUPxKiPLvY/ouka9vF6xIc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366de00f-c293-4681-5bf5-08ddbfee2881
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:12:56.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ThnwJntv+LGyzArbXO6nvqA04h+rwajkIIglKFXOPRM2gLlhvEI3GR/UampgQZtUpW5+hg4NRFDbr+8MgPoUL6E2WviDj63u9gMBNoMML4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE3MSBTYWx0ZWRfX6+/ugSq2LhIC y/l2vEMQxqAkTf3/xF7W+heyEZBjH9IPn34z68JMR7bYEHDJvZhjvCbzgCLiEgcAPPSURbGqcUU lDWNM5GIAKG3eKMUtcjX1niz3pVvu9uEIMaMuN/YmisKQWfz5oVTLO/CG7w2OQgjB0A7wVUBoA6
 5UdvQI+BMym0Ouo0eYyDr9kfQ8zoGiks58zj7VwpHuin0nOJA/oNnVn39qvUbHrt26h6rG9njhD zXY81WoAgOgxPa7ILTfIvE284My7vQxwUOuHBQ2p3Ms1Nsu0hzThZVvZoeTjosyzxvQQ943C3M+ JodITrqR+8JvJAamMvlk+PBUyD8/JBFZvXZeCIUrZclYjvVR2olVc179khLf0iyqtOQAXhfbxrY
 7qZyaLiFIcYomrmq3rncCu5AVPQxai6S5LvQc6bJuIg7X0Ifv7fl/cyR0x8I9XrF5+6aVeHO
X-Proofpoint-GUID: CAS9lvWc4pLQzNj6SuMTIfYKmGM1rzPY
X-Proofpoint-ORIG-GUID: CAS9lvWc4pLQzNj6SuMTIfYKmGM1rzPY
X-Authority-Analysis: v=2.4 cv=GqFC+l1C c=1 sm=1 tr=0 ts=68701ecc b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OTzOfh2FCjugM7AudhwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600

On Thu, Jul 10, 2025 at 04:03:01PM -0400, Eugene Loh wrote:
> Okay.  I'm withdrawing this patch and will post a different one in its
> place.
> 
> Your first proposal sounds great, but I'll go with the third one (which you
> recommend) in order to mimic Solaris more closely.

Actually, looking at the code a little bit, I think the first option may not
be bad at all.  We can introduce a new error tag:

	D_DESTRUCT	destructive actions not allowed

and report that one from dt_cg_clsflags() when a destructive action is being
reported and destructive is not set (in pcb->pcb_hdl->dt_options[]).  That
seems entirely reasonable, and while it is an enhancement over what Solaris
was doing, it is also something that is simply possible now where before it
was not really considered the right thing.

Even if we eventually support pre-compilation, I think it would be reasonable
to expect compilation of script swith destructive actions to require -w, as an
extra safety (requiring it both at pre-compilation *and* execution).

> On 7/9/25 19:45, Kris Van Hees wrote:
> > Yes, this is a bug.  Solaris (and DTrace 1.x) would load all the DOF into the
> > kernel, even for probes that are not (yet) available (when -Z is used) because
> > the discovery of probes happened at the kernel level.
> > 
> > Since we do it at the userspace level, we do not load BPF programs for any
> > probes that we cannot attach to (yet), and therefore the destructive action
> > condition is not detected in this case.
> > 
> > That is obviously wrong.
> > 
> > There are a few ways to handle this:
> > 
> > - Report the error at compilation time, i.e. if we encounter a destructive
> >    action during compilation and -w was not set, we report an error.  That was
> >    not really a valid way to do it in the Solaris days because you could compile
> >    D code and save it, so you wouldn't want compilation to abort due to a
> >    destructive action because you didn't know yet if you were going to use it.
> >    We don't have anything to save compiled code right now, so this could be an
> >    option.  But it would change the error from a runtime error to a compile
> >    error, which is a change of behaviour.
> > 
> > - When we are ready to load programs and start tracing, we can loop through
> >    through the compiled clauses, and if any use destructive actions, abort if
> >    -w is not enabled.
> > 
> > - We could have destructive actions trigger setting a global flag, and check
> >    that when we start loading programs for tracing.
> > 
> > I think that the 3rd option is likely to be the nicest, because that flag can
> > be set during compilation, and if we ever implement something like saving and
> > loading compiled programs, this would still work fine (we would process BPF
> > programs that we load and set that flag upon load if an instruction is found
> > that amounts to a destructive action).
> > 
> > Thoughts?
> > 
> > On Wed, Jul 09, 2025 at 06:39:31PM -0400, Eugene Loh wrote:
> > > On 7/8/25 08:15, Nick Alcock wrote:
> > > 
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > It is unclear what behavior is desired.  For example, consider:
> > > > > 
> > > > >        dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'
> > > > ... isn't the lack of semicolons here a syntax error? (Or have I been
> > > > inserting them pointlessly all these years just because awk needs them?)
> > > I routinely omit semicolons.  Okay since even Solaris.  E.g.,
> > > 
> > > # uname -s
> > > SunOS
> > > # /usr/sbin/dtrace -n 'BEGIN { printf("hello") } BEGIN { printf("world") }
> > > BEGIN { exit(0) }'
> > > dtrace: description 'BEGIN ' matched 3 probes
> > >   CPU     ID                    FUNCTION:NAME
> > >    51      1                           :BEGIN hello
> > >    51      1                           :BEGIN world
> > >    51      1                           :BEGIN
> > > 
> > > > > The first probe exists.  The second one will be ignored.  Solaris will
> > > > > reject the script with:
> > > > > 
> > > > >        dtrace: description 'BEGIN ' matched 1 probe
> > > > >        dtrace: could not enable tracing: Destructive actions not allowed
> > > > > 
> > > > > On Linux, we have:
> > > > > 
> > > > >        dtrace: description 'BEGIN ' matched 1 probe
> > > > >        CPU     ID                    FUNCTION:NAME
> > > > >          0      1                           :BEGIN
> > > > > 
> > > > > Perhaps both behaviors have merit.  For now, just skip the test to
> > > > > avoid test failures we are not ready to arbitrate.
> > > > Does execution fail if the probe exists but there's a BEGIN that exits?
> > > > I guess so.
> > > Right.
> > > 
> > > > So the interesting question is: if you start with -Z and
> > > > specify a destructive action in a nonexistent probe, and then a
> > > > USDT-containing program starts up that provides that probe, what do we
> > > > do? If we don't terminate, that would be surprising. If we terminate in
> > > > the middle of execution, would that be more surprising than checking all
> > > > bodies at startup and failing early?
> > > I think I finally understand what's going on.  The point of this patch was
> > > to move on to more urgent matters, but there is maybe a bug here I should
> > > fix.
> > > 
> > > Solaris rejects a clause even if it's not going to be used.  E.g.,
> > > 
> > >      # dtrace -Z -n 'BEGIN { exit(0) }
> > >          bogus:bogus:bogus:bogus { raise(SIGUSR1) }'
> > > 
> > > Solaris says:
> > > 
> > >      dtrace: description 'BEGIN ' matched 1 probe
> > >      dtrace: could not enable tracing: Destructive actions not allowed
> > > 
> > > Nevermind we do not use the second probe description.  It's a baddie.  Our
> > > Linux port has no such complaint.
> > > 
> > > What about the case you propose (which is, after all, the question being
> > > addressed by this test)?  Well, "it depends."  Put another way, we won't run
> > > a destructive clause without -w.  The problem is that during discovery, we
> > > might first encounter an is-enabled probe (which we "enable" since it's
> > > safe), then later encounter a real probe and reject it due to its
> > > destructive clause.  If you squint just right, you could see this as being
> > > not incorrect, but it's kind of goofy.
> > > 
> > > Ideally, enabling probes and their is-enabled probes atomically would be the
> > > right thing to do.  That's a tall order.
> > > 
> > > But falling back to the Solaris behavior of rejecting destructive clauses
> > > without -w is the right thing to do, even if we are not using them (yet).
