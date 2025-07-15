Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7072224B1F
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577156; cv=fail; b=r3IYIpKqKqhKdYEGWvuH3dE6Dy+AzOduouOr4h0OtU45+M1iQ91A9NDUN4QLbrWl01900Now10rag7xsh7aiiXIhl9l/pqEoUUKCyy0ZuqzJmLeC8BgalQzZebzkKpsr21mielmcDdyftHqx5qz9HFrppycXpAoEcRRYRL6yIUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577156; c=relaxed/simple;
	bh=+Oyam288VhpaL8uitXUdiGT1oopCNsSOfsOIJjq7DpM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=EuBKYq2p3ElZ6rzMVkmhRh0lnwN/b8UG/0l5v9uKGEY8zlILqJ9ZBkdZioxIGg1m/+Mxp4MdZRc/wSxn73giBcvQ3W7HnNnxDWcJSdi8N7KYgb69uBv+eKf+fHmGHaZMUQhb8v1ob8zuKbpy8p5lkedYNEVJV2+NbgFMf0Pk+N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YInCh7dP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X7Pn+4Vj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YInCh7dP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X7Pn+4Vj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YvWB011872
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BPakubYRyTQoNA1Trp
	TLHTEX1aBk/0rODsPsLcAF7hs=; b=YInCh7dPRHqd7unDndXbfkz2tf3B6udpKH
	3wfWXRI1Os7zybKibM9Y8x8fNa/ETAfUmw7ZuVuQ6PLIkHbhpiduiL4vrMjUrJR2
	hZY0Cpm7pzP25b+UtVcqi0FOGapBWUkUcrbubq1eQuSTAPBVZ9i4Q9qfN+EkSncv
	5RU+s7+ihxqK8RE/e5gjQrutI1JELidjkjiBDVRqx7Pi5p/r0MakFGi4WX4c4cnk
	Pl80jmFKAu+v2GBHpneX6ALJcWgkjhCqCSzV6jxfBqL21Cptsvo71w3Hc3TgYCPi
	UEGw2u9WWZdmVRfQOFNkG0a7J1SFj03Xt9WvC/6M+pnxo1pLc79A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4pbvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:59:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FAKK0s011722
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:59:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59tbpt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y51nwOLcpHO+kWZ9ZpSIQbcgpnK7FWwti4Dhx2vrByPPKIF/6U2HhUs+4zNHAqhv7ZbdvxjpkTT+rWGd2iidBMaCgZWIX+V7CdQeyey2ryc/QcBBpVj9fdv1rMF8jjKmHSf4u6QlIYh5h4Y1G0yu2VxzhJlVRpc/ibcbBWlfWAQh4/mokUhezi6/tPWLls867suahAdOrM8Qh08eyTKb9fn31tD9Cm+GjMpDuN4wWCPrYVQs2+jZUZkVRr/LnhZKlfAyjbgEgU0ez9kR12l8DhshX2SMsBUnKcjPQEA3otY6AHI0J7Z1LPMuDYI7T9h8nCRU3zpuAbc3WJNc3L6ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPakubYRyTQoNA1TrpTLHTEX1aBk/0rODsPsLcAF7hs=;
 b=b2583rQRRhzNWp5wB7GQqaqisak5053GQtng8j6t/uXRZ4g1cnTFTBWo9LUWaP2glJkRpH8Rs1ZJfTzVstIifbNP+6sQxbGM/Kj/3iM1hzPr3nI6wV6DSbevtbqycOYmRJriBw+PNSiAXzrT6bMhJTuQUShTsNVexSLwLzezqidgOCMEm2Tzt73L9pOO1v+qNQJjuBrQBKlbnsmmyTlt9SP1+FIj6gRhme/lN7WReaZy4+1HZnqa+b07EBH1d+Zr8SSX+tJkX+v4m3A2Cfg/2y92G+2eCIzbg0Qeq3vHMdVHd6/r8urjHmKuanyZAI5GE5IgcrysJIufHmJ9xDRvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPakubYRyTQoNA1TrpTLHTEX1aBk/0rODsPsLcAF7hs=;
 b=X7Pn+4VjpAUwhIjnK48L2EL1qDWjMSPvVdO31V+i/pOIFezoEb8p0xOkhSiBAhZ7rGpI/mIMRyIzo44eHd4a1e3MgD7NV2+lTCIdw8fG7b6h7ssWNKteREaybk3gKmCGlWQCeo6Oe8snRNG9sYXhY+eRruzuM7C97fNKUDUEkgE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS0PR10MB6920.namprd10.prod.outlook.com (2603:10b6:8:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Tue, 15 Jul
 2025 10:59:06 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:59:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
References: <20250711044024.1587-1-eugene.loh@oracle.com>
Emacs: because editing your files should be a traumatic experience.
Date: Tue, 15 Jul 2025 11:59:04 +0100
In-Reply-To: <20250711044024.1587-1-eugene.loh@oracle.com> (eugene loh's
	message of "Fri, 11 Jul 2025 00:40:24 -0400")
Message-ID: <87y0spsosn.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0498.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::23) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS0PR10MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c20fd9-2fea-46a5-4ac3-08ddc38e9e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j7F4D7qu5bRGXOJh5u5IEnmoeS0s1BOn1YSGLI6G6sK57qu5gLlHp2GgwhUw?=
 =?us-ascii?Q?neOLHD4DICHF/aJ8Hd8iqin7xUOoSbgn1IWLGaGTqeY52HHHX8JNEVBu70eE?=
 =?us-ascii?Q?IDz3JV4M0RvXXCGvKFhcC1YWpHW00JYN6WNpZW5Wd0b4/DmZyBMJU5MFMZaj?=
 =?us-ascii?Q?fPiDI9UFtEpDR9SjOUslPy6TYUcYu7YzI7EdkDGxf/ns1zhuxPrBSNP0PaVT?=
 =?us-ascii?Q?E3phf/tF2FWHJaJSBUnWlHoPxXJULpHKQv2lQLjR04MeTZ70hEPcOUGIkQMv?=
 =?us-ascii?Q?Khf+IBSUf2F2yRdJ95h8B1t8ARdVNiIKRtL7zMEoQ+PXIqyp3dEnIdTNZgsp?=
 =?us-ascii?Q?1FIdzLBxpMmi1JkkN0EjA9BrbANkradQh6AjnhlQcKLMwefjjnvudCtvrFEJ?=
 =?us-ascii?Q?cuJ+Us5kxClGR7qtouoXpqmV+TgxIie39073PDs+CFzY8AO7GOOlOObnXVu2?=
 =?us-ascii?Q?RWDFY8xQu7BQ9sFCcuGRopPjXzBjRAHg6Wbj3f3WcSrOz3xVeBo+bO6Y1P/q?=
 =?us-ascii?Q?B5rdwoXdLHiNhywCSV37psXpVZxSuFiKRvFuxLZs/lPhgqT2VpOwhE6pH/uW?=
 =?us-ascii?Q?nOAa3V2xpJ+uWuot86UuU+7C9oafJfKlk743KCF0lsHkpBUR0Ca4OzK+A36p?=
 =?us-ascii?Q?F44NxAEPYuwmrbCA1XpdFeqkFW/FsRpVCIyHnzryZ7GAFj+eTnX8o6mZMARd?=
 =?us-ascii?Q?CQoYjPwn/R/LXIPwfjbvAmyRKzHIRiw2LPfIG6LYqcdq+KhKRyW9RdRF5h5V?=
 =?us-ascii?Q?t3rKL4TDRjGN219TKtC+4ta0D9OLtgw2Hwb/xTAzAioN1N+UgxqEoCNh519P?=
 =?us-ascii?Q?9VqBRVsL3C2U1hkMcoWh8YcC2xkDNG5mT/jstJMHfNPxCfklVelPpE0NLibK?=
 =?us-ascii?Q?P4N3rsdjBvz44N35ZCs9T9BNI/cfaA5E0+JwOVgdQCqKFkcqLbMFT8M5vbpb?=
 =?us-ascii?Q?8dzWx5wQR7ABtUW7/ceD0oFooFDDO4mJ2Ltdvkoaw/c+6bSFmcIgHVCWe8b6?=
 =?us-ascii?Q?qaCUjNahweQV6G7dioQYHkl6kEsqoagE8r80sGxT0T0Dp+AcK2ZAx/mAe83m?=
 =?us-ascii?Q?LjIcr+vwRTtwzF+8B1QDelhU7X6/mSkVbWUSzOx9VvTbpRizotDCLDibrxnU?=
 =?us-ascii?Q?iTVNpsjbuigF+Xcv9cKLCN6DvSEYutvS6SwZy7GjC/DXcyupA96r6Ziqfjfa?=
 =?us-ascii?Q?FgkzgGUQRHrdJUo5W5R495UNleGed5a78TUx2Z8IRpiVf4YP5sFriKpn5Sjq?=
 =?us-ascii?Q?YfKLE/FyDRRKGP535YzaC3PQ09vnuITeMwogf+XWmnkxJYaUkdU6NgH9oPaW?=
 =?us-ascii?Q?s+JolHwWvMItyVXRavVg0FAnb4ssZ+NfPJjpUFiYO3Skcqf6GghwzmBNIwOV?=
 =?us-ascii?Q?cKBXPdjP+VwZiDrG7MC5GJCaMtgSrWvdMh8XfMaAtX5qsUiVbhWT8pfFadCW?=
 =?us-ascii?Q?WKkXB39T3jc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8ET8odS/xKNMVbo4hQWQ7sqETEtnIxinAN11FtavP6n0OWsWa0WAJxryUQ4?=
 =?us-ascii?Q?ffOI5cJp3V9F11p3Ufq8CtLqD2bxGk7h4ny6BJQ7yM7zDqtBC398GbbCR4ul?=
 =?us-ascii?Q?34VD5GWxJFsw09H7IsyMyPh4sVZpIJhQ/i0E0iC5dTQ1IbPbR2RmTH1f1ugX?=
 =?us-ascii?Q?j2d99kq+Qe+juBVxVzcnc7+tWDHsDRTrjqp0g8YE9xSRUbPCZzwDzSwXMpav?=
 =?us-ascii?Q?eY8QDZ5DmI0Y/Vd7j9FPBsO3IRXeT7rRI1uL8dcO3yGWiz10ssr9YGBm/iB6?=
 =?us-ascii?Q?fhcKA+5wJdOPxXXCLLf2TEjAKR2ggSNLscmtLoP56vnmzTPbmCaoC1HHU8Zb?=
 =?us-ascii?Q?6TokWF1RKihbPQGMCLFERr1A+Twu4Fb4dFR8fu3trH80VdJAuoJCgFqwQOrZ?=
 =?us-ascii?Q?YMcUIS1Tv7LVGNq6MFWe2Kbet6sCBTdZz6QSpQsDCgXdDb3AZgG/J1aGMrQM?=
 =?us-ascii?Q?rplAfVsrkVdVnfKwQjPSQElKJKgm//C39ntKXyurcyDdxVN8F+f+9m+SxP60?=
 =?us-ascii?Q?osiNuFIzR9VigImN/uZk3JQEum1pjVolyhq7oXxxj10ovI+jaKp6SDcuDJz3?=
 =?us-ascii?Q?s8TzeW4V3vCLhipJL3BVfnK3uAESlIgrMGYwdmpeACMyOhsxvjq3D4ifVFkK?=
 =?us-ascii?Q?xrsoqsyJk9MsYfLolwD69L67XkNOW0H2yDGV7fBM+HeK9l77Na0VKpNEuvNe?=
 =?us-ascii?Q?mBSTrGw9/6298GaFEUN/JEkmgWAqHVfB5pmtzvWbi63F8HikZP/RHL593WTd?=
 =?us-ascii?Q?16c8YzJ+/HC2vGXT8gt4KxC8CV7jChqD8lavAtWkneTklXGF5PPTxyGM2Zo3?=
 =?us-ascii?Q?wgAcdE78wi0A9unzwtXObjH3noTQuiQEcMXBzVqTLMlJlNRUnkWTlMSgduXS?=
 =?us-ascii?Q?6cbxPaenpOmyY+K4NK1HSFi5AxYGxUjo35AOpVMk8PUB8CjyBVyD5Mp3pSnQ?=
 =?us-ascii?Q?hcGmkNeqVocum2rwX3YER3fUDGbvfyheLPrVg/3jHZK+TftPOBCA9WAJUr1E?=
 =?us-ascii?Q?FWOOuRkWr/cAx4xeOvkFUryaw1QtjaCKsH35LTb5Yxf9hkV3v28wDFjIVUtv?=
 =?us-ascii?Q?r2UewmfwlwCyqSZZ2TmvpZP9+rBL/6/Nv990DxIRdLS6Rgm/+Pkl2SZMQuqK?=
 =?us-ascii?Q?g3ZPe9yl6OqM8Cr2atzoCavsYNGWolOiJ1tUC+KXouqYZyxuIGdyVgWckB/g?=
 =?us-ascii?Q?XgZA0XnhPq3f56iA+Ks9/Ot4YglKQ6PuUgCEyetalpXZJcTXtSe2HYMNpAhz?=
 =?us-ascii?Q?ixJsS1aEYE8rUO0KlDUNhwcMz57mf1/zyXGpC3JuOr++j9EcCfstO054Lg0d?=
 =?us-ascii?Q?SZxEgPl21jD8G1setYV/UUICnVLGGq+yppR1zxEmbm3jeODz0KTogTWQW4nX?=
 =?us-ascii?Q?n47R/Vbaj3coocch/fFhO3vGkGKMI2lkeuHCQTud1Hk+L/f8dQzS/EOTZPyz?=
 =?us-ascii?Q?1kqBs8j6+T3vzccNLqAUJt8lhwYYe9QgYpB5Vt7OAe5q39rvFxsnW5erdVgn?=
 =?us-ascii?Q?zDcyTp/TBqsfDWHBnadtT5q/mbm4KLhQOhI5VUQJbklkamdhKM2a9ldYkYDR?=
 =?us-ascii?Q?kpFsZdigAqYTXsKdUC1VlrAIwUytdVoU13ha9yNhn7U8h17TFVNT3oWX2QyA?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hy5S/4GVwEunx0hggWM+3Unm7efbuvKQNbnXIOkXA6YbRD41hZCAP5cxITPNV+EosyFLEgk7937XhKSUuxTD/kmWIxHUMLB2s8zAiWvL3ihbCpvmoQLXCiGm1kpm5FE8D8HYFDx/pAl7kneYXXDPt8zDM/2XLAFvCIu1ZHo+k5KmZddTbIBg0krMFvRZzk27wPYxFzYeHStHSD1jNA5VxK5aFRLyihfNJ/1Vns7Ck1WhY6wNtMfShKnwBCp1xSgoQpW+j2Np2aJhldV7jZ48oTJ1gr1WtcZCE7ijrWfiH8IgXpPxOJMvoDuqJ+HeOWUvh5O/ledSVp6gqUcjicDamxTup/oGdnwX79Ax3ngyqM+vVW+fDIb+/15sPhkPKXNTmC2d6L+DJ3qimkEm0pB79yo/YWj9F3Xt+Lu/liAtY/reWpMCUL/pUBbtSJ3UQjUKTdMBuGdUgGWTJGaAfXxl/yNzOGTfnf0sAzx9Dc9EUgvyBk9AwxKhC8A09K6D7TEv9C56tbKGVUqODs0PFyMDppz/h9xmgTRU4jH61o5Iaa0VLRtMFBky+a+JKjAFYqQ7AWuDN9KfrQh29UFUiJ63UoXC97PQij64X1QYPV8oi1c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c20fd9-2fea-46a5-4ac3-08ddc38e9e4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:59:06.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TPZCcgsfc0V4RFqFN2S4jkMuksbXoVrhiid8cFWKE30zwMyCJFECT9ZoeXGEUc4zv8ydb+IJl3j4XRvhRo8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150100
X-Proofpoint-ORIG-GUID: xrIgwsaS0eQkp02YmQLCdygb0V6d4SoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OSBTYWx0ZWRfX8fL05AfPnIBV LYD//5jSJBepjCZujihPuZk8WGxTYIulKpFqFADP3FgDH0zKffDqNVmokQ26jhHNgCqZyE2btZy 9wrkcePNRkVo8jWmiwfw0qFiz5z/iuQpSvG7zkidRLlLg/tQcbK4DcMoww4cLqJnXxA16W0MG+u
 EZWzo2LWcg8IhhG4ZwnmaRwSUAUn6TBZLzayNDYIDtXdaEDv9HepXzv8lgRe8j6NFVIgKZazzxX qt0ttYauDr7zIv7C7a9EVAVh7tO6cch19s0BDSszXlY5urBVBLSwwbKMrgvzLviUfX09AK7RhRE k2d0Jvv9iND/UXxw9tf1Uf4UzDJUZamLt5zjwvpsTJfHExU8LA6jhWDJzqT+JRuKzPO6sf6L88L
 71uezjyxCDNQU8otZ/Ap3LEdbTHqZS+J0pY2P1O5FglhaPn54MlAVjssa0zhmKYtkS4QBbDZ
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=68763481 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Lhj15T6qCWR0J-dbKbgA:9 cc=ntf awl=host:12062
X-Proofpoint-GUID: xrIgwsaS0eQkp02YmQLCdygb0V6d4SoV

On 11 Jul 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> If a clause includes a destructive action but -w is not used, dtrace
> should not start up, even if the clause is ignored (due to -Z).
> Solaris treated this as a runtime error.  We should do the same.
>
> The test err.Z_no-w.sh was misguided and is replaced by a more
> direct test.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo one microscopic annoyance (I am not a real unix programmer, I
don't like creat() and think we shouldn't add more).

> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 4e7618e05..e2c3bfebc 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1286,6 +1286,15 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  	 */
>  	dtrace_getopt(dtp, "destructive", &dest_ok);
>  
> +	/*
> +	 * If we have any destructive actions at all and -w is not set,
> +	 * error out.  Solaris would reject this as a runtime error.  So,
> +	 * although we could have detected this problem at compilation,
> +	 * we mimic Solaris and wait until now to report.
> +	 */
> +	if (dtp->dt_havedest && dest_ok == DTRACEOPT_UNSET)
> +		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +
>  	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>  	     prp = dt_list_next(prp)) {
>  		int		fd;
> @@ -1304,6 +1313,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  
>  		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
>  
> +		/*
> +		 * This check should never fail since, if any action is

Grammar:

This check should never fail, since if any action is

> +		 * destructive and -w is not set, we should already have
> +		 * failed.
> +		 */

(but worth keeping anyway, I agree.)

> @@ -431,6 +431,7 @@ struct dtrace_hdl {
>  	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
>  	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
>  	char *dt_freopen_filename; /* filename for freopen() action */
> +	int dt_havedest;	/* have any destructive actions */
>  };

A piteous plea: could we call this dt_have_destructive or something? We
call destructive stuff "destructive", unabbreviated, everywhere else,
this flag is only checked in *one place* and thus hardly need concision,
and to me 'dest' always means 'destination' and thus causes a
double-take every time I see it used for something else.

>  
>  /*
> diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
> new file mode 100644
> index 000000000..eb9365fea
> --- /dev/null
> +++ b/test/unittest/options/err.no-w-or-destructive2.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
> + *            even if a clause will be ignored since it does not exist and
> + *            -Z was specified.

Pedantry: ... it does not *yet* exist :)

-- 
NULL && (void)
