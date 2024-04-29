Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134718626D
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 17:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411367; cv=fail; b=EY2oXksAgwhJ+WDs5icw/bnm8/+J699sK6CdZVSW9uwEYCCT4kRpd8dPegw1nzeU/wY8cCVg/a7Uvos3aPvVokil92Xw1CghXhomoi858QTEXY7slgeU43HQlBLsDhrwtj2pwpu2WRImchkMmoCQ16ThXkhEIoOhak9Kf3cX2hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411367; c=relaxed/simple;
	bh=mbXdB5gkueIBesVzDdkjJziHAUxDPp1JRYxsCvbT1lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C0R0ABqFbgI/4bH9MzoeOrHAEF5SqiRXbRH2578P3vGo9oemFWAXv2m3gChRKykyA5L6V6xLFts3R0nu5oS6wXCQWipPr9PFUEV+fIoMZkn0jFFtiroyLmaSmAouiJnbDM3KEBHrygSC5svnNi/s3qDHtCFre9vryj9zcrkNUc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZQ3Vmrwe; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x7KgAiba reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZQ3Vmrwe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x7KgAiba"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGxaAM008562
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 17:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-11-20;
 bh=hzIM33YT44uWzhbk3Nl2Ur/ggLBqFM8GUHx5hv6k4qw=;
 b=ZQ3VmrweWVG6A4fLG87NqslDR65tpwHeuxv+dC1BUb9FtMBTqwKLyTGzgUlruDFsWJBK
 DIKysaU5M7rLKYDK7UXBf2M88YDmtwckL6lamMzg4BP0h8Vc7fzncFlzMZsCO2WQKfGI
 +/bAcnse3G2LUfBoCNhbNW7HOKI4MlGCq6MIax2LHVYkT1OZJX5nPOE92EPO66qxqe4s
 /xd8LrXyiwOglPyRH1aYNNXwFCRDGgn/lhVHxfJeNWAaUvaaDEqWcYTGBNxKfTMy1F6E
 EZzsDkd6FK2QzGJEW5AA1u6hPU3mtJsXVDAo26uoCFhqW+V7+TXbp9iCLMQr8yvWDBdN ig== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrr9ck7ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 17:22:44 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGU8E6033179
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 17:22:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt6dwy7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 17:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy+rJiWm/ESapq8QgYu25W+E9tcJp0sR7h0TPwKfdn9lE3phrri9jEnXWdUl/QROdqOLCvnreBa1OVWTXvaW7tVnXRTFMZWNAFoynte+ShNdX4mC25UjsSJ3sDdiaUPRUald2Tl0SRUbsoXFv3U/vXdCATWiJeqaPypWJo4LycgFcsVeSqZt2GpKHYpOxb2fE+5GfNHBAVrn/0kIo7HGJpcWX7xbVLPH+er/DTapn+4AaOHIeo2kSRg6ihpa/ln6wFD6pMD9qqQJeTxZ6+uSx5Yw6NLWqMhjohTVF4pVn2qhBdEqhuHRjrEILZzwzLBD3y66YLV7crb0FvI45aGZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgx73mrmXKb/BAaGHx576TFDHNGL+NxxFBjxaJv+Fw=;
 b=HyUHGU6C1etXtyaRzNfgoeAj8Nvavlc0l3BMAYxRE/XkSGhIdxFEnyYs6OyqfFLQEa923+9KcbAsit0bYXTv54mYwIIIIWeAzQMgZulS0zkkHJTPijU0M1w6yGQxJizFOZbOLxbrC0ICGkceOswrqhntb2+kcnuPeZsFJDT+o3A0OIjhIOES3S7kqlJNa0z8Tmyi8LImAcUniSg0W0tBotDLzINHgE2OfTpHzyBi8H5y564F4KWqZLSHntTt3na5pOUCFG91lHF0NpxS57zK6xT8hTIpfLlnSWLZGZPY81IgdzFMXI80ZGqWqkiFVWe0CsYePOr/w0qESlad7qQxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itgx73mrmXKb/BAaGHx576TFDHNGL+NxxFBjxaJv+Fw=;
 b=x7KgAibanyxYJMxrZPhCDanr66V/dey009EhnPqjEWEjc8hVcCs2zk8SQXNy7x0QK1R7lT0b+jIhWVJgvx1EvnZMn9LM0/hqRZHRxXAf2Vi94k3c9w3KSDxTKqrwQHVsjk8xJB2TPeKqPcLE1MPTwoT+4rtN0s6Agvte/gX95ak=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV8PR10MB7917.namprd10.prod.outlook.com (2603:10b6:408:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 17:22:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 17:22:37 +0000
Date: Mon, 29 Apr 2024 13:22:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Re: Possible (long standing) issue in the BPF verifier?
Message-ID: <Zi/XWmPLl2Q0iuWc@oracle.com>
References: <Zi2n0lpb7Kk15qKE@oracle.com>
 <26b372d8-2ad0-5464-92e8-ace3fca9119e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b372d8-2ad0-5464-92e8-ace3fca9119e@oracle.com>
X-ClientProxiedBy: BL1PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV8PR10MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 2178f593-77a7-4388-01bd-08dc6870f72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?ZIOvOTcKgorPcEpjLdbCMPNwxclMoOfjKLJWE4UFOGHNf7PFokEAsNmT5O?=
 =?iso-8859-1?Q?FIavCNajDLs9vpjhyADhnuT250YRL4WCOLoyYaITD5KKSX8RxQN28OjFPR?=
 =?iso-8859-1?Q?ByEt8uWT3uC7AyFJfpmhUYRmFW7yleHd/tMt0iBNBWx9hA+oAmlzSHoqom?=
 =?iso-8859-1?Q?HOHa3yWPSrlaAx1ZstI4NKLtyEbh2sLEsIW9zJjJ6GmoU+493o7/5vfULH?=
 =?iso-8859-1?Q?zxPszpvivfzFCcDyF5nH4XPdvnmyEyA14dDx+9tO8PI8u7/dg2VfFl882w?=
 =?iso-8859-1?Q?jiBriGemN7mlBx2s90oYz8ihQW7jV1Tgnr+febFB4351V6hAfr+GDLpJjH?=
 =?iso-8859-1?Q?+gMF63jyK0h+UcRKECeFv0sOXdJUbMdncFtl8YrH4QbC6UJ+23rTD3jqbT?=
 =?iso-8859-1?Q?pF8HZojrb0pgLAT68h/d+sikDZQXL8DDE97GFGaOXuMfrAuNLNj2pO+Exj?=
 =?iso-8859-1?Q?EbJFF1I7gzqHbgoGIy53csAb98uPcNNAMrdnU4Rrzh+/v+ugjaRsBrkLeZ?=
 =?iso-8859-1?Q?HjGxlvZKd4GovjNQAjNUHETRzL622qNg8axY9M2VBCzKCVmHOCtDxlEPhy?=
 =?iso-8859-1?Q?8yQ2furoX89NYTKYVRJppdSxjXjkuNi8S2VQ3JPRII35JI1sIrunBv5fTA?=
 =?iso-8859-1?Q?kqLv/B9TMttIim+AtpOHWiTZF6EKpI7y6Wt9A0AK8uvquuhZ1icrSej1Dx?=
 =?iso-8859-1?Q?/hq7LA+XgczG3bxFQcffI2wcUyq/oLsSO+bOfabuRogiQX0kOyM3n3AElz?=
 =?iso-8859-1?Q?Q2tcxOSYmpNOsyDPnMeDyB2kZdZG0Vo8gMp0JuXYUdkwwAmcNfdzfIPXzH?=
 =?iso-8859-1?Q?8QlG9l7IrouaRYgSz4yQfjAtdJTaiROZWBF2K4iQ1gnJIBw3MoyV5Rze79?=
 =?iso-8859-1?Q?TD+k0O0p4bqQ4vjqmcBbzmT1oPSVqR/FYHiaos+TWE0wt1X33RhW8A4KEC?=
 =?iso-8859-1?Q?mUgblNzsu/lc3YLN6BUYFFO3IqFQhi6867E+dkbLaTyEme1NQwd0H76NHi?=
 =?iso-8859-1?Q?bRU9b/Scqk1GBI28ug+uqLcST+sY9uE4U0jsYd2IOqICGdHYp//HjHHaaC?=
 =?iso-8859-1?Q?e7eLfnT6q9e5FWXr5pNc2P84GMNLUDChDxO+t2XlG0LoIoCD7Hh09IMylW?=
 =?iso-8859-1?Q?BtcEJW22VvsTnKJAvl4jgHHKhdpXxWNwKGGzwOebzID/dbJkV3o5KtF63R?=
 =?iso-8859-1?Q?JGIm8/ACkreNQZMERTNacvGQBVboKE9U02K500Y0CtbpljUCVJq4c2+JCa?=
 =?iso-8859-1?Q?v1rJekXOpq6xpBE8TpIBinSH5csbUb+fN2eOL6Vsj1dbcnotaOrQzVpg+g?=
 =?iso-8859-1?Q?Ltm8JTMjLn2ouAbWJCO/K51Xsw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?zPow8vemmVZ+PkrQLU2CzzLsEcPVE/xDPX8ggzWuhF0ecrinvAVgHC/Wck?=
 =?iso-8859-1?Q?2asRFRF/m8SC2demEPUAWOErvw3ftfHo41FjqOvucrNW1E4h5UzKUcVkqU?=
 =?iso-8859-1?Q?+FkOunWzToGnHRqWfy11HhEUSzLEgBppddYLCkd7sYlAgCEmDWqrQWqE9F?=
 =?iso-8859-1?Q?mMyOnrAoMEI6M5H/dIrPjl3FWsZ6Bq69K9odbzNgk9hHzCX/3XCuR5Ieer?=
 =?iso-8859-1?Q?dPCDiccdrTPInh01MgyVC2o/JIjjB1HLxC24T3FQnL6wA6DIvOx4UakpSv?=
 =?iso-8859-1?Q?jJEI4Ohc95zriaGVjOoZip99OkD+uzNuDjNoVNHOxTV+S2dp4xNwYDWHGR?=
 =?iso-8859-1?Q?+XZcJIzgSACPdozZDkobVAwqmkL5GZJE5b+doytAWWVnZmD0vH982ijO6B?=
 =?iso-8859-1?Q?nmvG72n7wsOp2qiuGWVEjOa+31yLaHNhBf7C6Bf56jfjjorVhnGByIOGhs?=
 =?iso-8859-1?Q?asYkPM26ZxDA00xrLFtoQABxFxVW0I9zeD7SId93K81+t69Mi2vrU3Hsxo?=
 =?iso-8859-1?Q?2bygMdekTjJwhX0k9qKr99c5sJSUL7nMAKGdeGrULToDAUPjgjTCPfIcqg?=
 =?iso-8859-1?Q?bwUn36MhbCfRkuEvIck0CivZSto/qooNtGkriCgNx+w5Lxfe+E8pKTrT4M?=
 =?iso-8859-1?Q?E7qjG6M40VCuqPxeel1HecTAnehAY3aFaIvG8jpTG/hC3vzXeC2sjnkgmF?=
 =?iso-8859-1?Q?mckEIU7ChSlRnvdguKk+XyVmLFktgoKlkqoJsoK6T0eb5OVciZvwsOduX7?=
 =?iso-8859-1?Q?flhnSexFXk6BamFUWlJAQIgqK1aoI65N0gzEUaTWli6Rz7z5JP3qA0aKqN?=
 =?iso-8859-1?Q?ZLEoS4Xr6DRdpWbS+U4pR6OH+vTKfsnTYxHLQNeF6M6YpTfatrXahS+IQy?=
 =?iso-8859-1?Q?/lagX4TNOumj124lAPiiCTYI7XNox0EHORWP3MYqD2I9jX84CY2Res4lEe?=
 =?iso-8859-1?Q?LGApv7mk0K2wxXfpsVPC+EBUoSVu3uRnLEokTAem4FFGb8RUGXbqLvpynN?=
 =?iso-8859-1?Q?AxOsM9xrjgt8tIwyLbv4kBEdUa3BuQVvCYFBj7n2QZOREbSRJlWV2MNoki?=
 =?iso-8859-1?Q?bRDJxRP2G7ztCKy/nxy8G7sYxH0PihEGQK1rCY+1Kr63GBD9WTbspy4Vku?=
 =?iso-8859-1?Q?VEma3k/x2MmnCBMOKkxrXPCROvT+RwiKCMW7lxlFxsqUVGHXaSTzt7Qx1r?=
 =?iso-8859-1?Q?IA9feS5GMHHDDyLEv6kAChPwc6eZjBhZaxvrK0vX3o2lZoTvRpGSEDNmk6?=
 =?iso-8859-1?Q?j+22g5Dwhn8ZFywzf1HhciGtlG9WGW3DyfxvOD5M8IVoCYFxM6WNMWcwuU?=
 =?iso-8859-1?Q?0u/GWQdWQNUllB1r9LbvNjwyJok8xaESVvYp3go41anuj7XCZDDQv8vitb?=
 =?iso-8859-1?Q?Kc6VwmxzTXWnW6vEh68CDSOfOjCzGNoUwFZOltqHwclawyDaoneUNDVxHS?=
 =?iso-8859-1?Q?wBFClbzUQ2jn/8VoRxVHMN671L6YZuiI6e9REwFs62w/mwjj6Q+yNaQJq9?=
 =?iso-8859-1?Q?cFnpaLdfRxWR4bDFJFtsUo8Pc91kTxxVxZEjcY3aJNGKril6JScd50HNwW?=
 =?iso-8859-1?Q?ShhTLhRwUTHx0Uux96+ltGsRcoz/o/C7ic/Dv8Mb3KpdrkgXa3JjqDfhmV?=
 =?iso-8859-1?Q?tRz+gmQ0wGt4UNEZPGJGiL0t0dTzTqyo8JmAKV7H4Iui0Iw+fH5CyT+A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/mD+PJ9xcl4uWvag67WWKz4qrbbXqDqdKnx73tKLrc9XZbGijQg5rlxRebCu0k1O7awdRo8d5r3YJn4sVhiVbvodQ141mwfa2IBNadiAUKyt1dEx+cNxdazza97upp3qImoOvHOouPoz+RL7lqUDaYGa/G1ERnLF2sID3qJqusg+jBRYDomluUCxylF8Vcy/C6gwm43T59iBswvTbfrbQgv+lNvEA5jhBnC+mFjimsf3To+dzgdO7gjWDHIOohpGMe5U4Fg8Yx0tLJIaFljoDDkfbrEHFQFZmD4Asj0QyYseYvEPBXAHETz/feZxXZphOgvaohLwDtgWwn0T2E6mkJPKF7j0k6C3xj68VPpbc8075E6EIAkILkVhl4QsYH9H8UcMS4NdgF/uNjCUIKljCbmiJq3lxgGCHud4+8uFAkyy8XLrcdu08Dkbn5gr9AWxDW0ZEK4BPsjIjCTUQY0Q1PiPpAlwaplX0VaulCKTtp7zclDePjmJRjFW4eIKINnE3ouc/HFBJz/4YRI6H2H3AzYb7CBJQBaS1SliTkS0CAiuftmpKgpnVem6H+KZwAlOYSeswCVxI/T95Y4cq/idKuDyFBot36QkLx5xbytjcRA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2178f593-77a7-4388-01bd-08dc6870f72d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 17:22:37.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDdBTOLaz7YxRUTadTklcrDHqRoRFthYDlMDHWnggdt+yH2NRP5Bcc9E6UdMamYZtY0i9J2pRLl/lXjAg1qeSv6Dk1vd6cE+DOmm3eXhjI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404290112
X-Proofpoint-GUID: zMw-ietc6W8FZwLxFqzT8APt_USZQjkO
X-Proofpoint-ORIG-GUID: zMw-ietc6W8FZwLxFqzT8APt_USZQjkO

On Mon, Apr 29, 2024 at 12:42:36PM -0400, Eugene Loh wrote:
> I'm confused what problem you're describing here.  Are you saying there is
> an opportunity for the verifier to do better?  Or are you saying that the
> actual computation is incorrect?
> 
> So far as I can tell, the actual computation is fine (at least with
> 5.15.0).  Specifically, if r4 is assigned 253, 254, 255, 256, and 257, then
> after the +=7 and &=-8 I get 256, 256, 256, 256, and 264, respectively. 
> That looks right.

That is not what I see on my OL8 UEK7 (5.15.0-based kernel).  It calculates
[0:262] as bound as shown below.

> Now, [7:262] & -8 = [0:256].  So when the verifier bounds the result as
> [0:262], it isn't wrong -- it simply is not as aggressive as it could be. 
> It should be able to bound the result more tightly.  Is that the issue
> you're talking about?

Well, in this case it ought to be fine (and it is on kernels other than 6.8.0
of those that I tested), but that is simply because you use %r4 as upper limit
for a loop condition.  But if we were to e.g. use that value as iterator value
(which is what I am planning to do so this works on 6.8.0 also), then it is
important that %r4 *is* a multiple of 8.  So, the more inaccurate calculation
that the verifier does here *can* cause actual issues because the value that
is calculated is not correct.  That would mean that values calculated with the
use of bitwise operations like AND cannot be used as actual numeric values in
all cases.

That is a real issue.

> On 4/27/24 21:35, Kris Van Hees wrote:
> > So, I found the following in a BPF log on kernel 6.8.0:
> > 
> > BPF: 799: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,smin=smin3
> > 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,smin=smin3
> > 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff))
> > BPF: 800: (07) r4 += 7                     ; frame2: R4_w=scalar(smin=umin=smin32=umin32=7,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1ff))
> > BPF: 801: (57) r4 &= -8                    ; frame2: R4_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1f8))
> > 
> > And when checking kernel 6.5.0:
> > 
> > BPF: 791: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,umax=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,umax=255,var_off=(0x0; 0xff))
> > BPF: 792: (07) r4 += 7                     ; frame2: R4_w=scalar(umin=7,umax=262,var_off=(0x0; 0x1ff))
> > BPF: 793: (57) r4 &= -8                    ; frame2: R4_w=scalar(umax=262,var_off=(0x0; 0x1f8))
> > 
> > And kernel 5.15.0:
> > 
> > BPF: 799: (bf) r4 = r6
> > BPF: 800: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
> > BPF: 800: (07) r4 += 7
> > BPF: 801: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umin_value=7,umax_value=262,var_off=(0x0; 0x1ff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
> > BPF: 801: (57) r4 &= -8
> > BPF: 802: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umax_value=262,var_off=(0x0; 0x1f8)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
> > 
> > This code is supposed to round the value in %r4 up to the nearest multiple of
> > 8.  So, if %r4 is 255, one would expect this to yield 256.  Yet, it does not.
> > 
