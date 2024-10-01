Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180451CC141
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812514; cv=fail; b=Zg1sBqw5i4WJPca8Sj67AmeYq22/qlLMWFOHCjo0zQCsglLVHyywid999Y4seYA9KRmvULCKW2XZU0MMHGQe2cXOFH0qdoOlVOROk0N9MVjUMH8AbWVRD75Zqx7UciANGDu3vcixvOUkPnshNhscnWhdXU28KZgn7Tz/pRaAwfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812514; c=relaxed/simple;
	bh=XUYM4gkiI06AeHpKMOLzs5ycq1jlQgU0WcN/uPjnEqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uISI3N2hLnPAI71KWo+9mbpyjSNFfWHc1oqky1wyFlaFOP2Q6h0lOJcccMlSHZ/7//WV+XiMLcM3g8ihqAx655FPB6Po78kLAghvsma4jQyWyer64PqCQbXYSJmaVZmlHAa8EogTjYsJfP/jJkATk1ZmVr2PyFj9gioEJq1NEI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ey8I8Cux; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ITtKYLjf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ey8I8Cux";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ITtKYLjf"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491IfcwX021915
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=NTxuVuAvBGfVXtGWmPW3h3eEcBugpnaHn1cHP32Wt9A=; b=
	Ey8I8Cux2lThLg815w8hgwVs63MoqHWhXf/ZgXes4eirQcryol6Xb/wRsIuT4WwG
	59NtvsBm6o2i784KAwyGLX8eJvmGRKVUYGifEY8/tMC//+rVW0Qs57em/T4KBBpA
	4eNbf34RgQXMZwI5HZkvtElOJi+foMXW9hfQ6o+JX9bo7H1BqRVeshiiq/cYUKYz
	s4WuP0HLOPmnd3cp/hcz1BfjURqdr1mInWE8PtHekgQy+HEhn9Cj3JyIMryLsyNF
	TmOQKKhpn6pIoQgQlHkd6SnktVPfE2pxWVxxCJtY9veW61NAaRA6XnZZyHrc8MmQ
	5FxcKe+1idjNS8e+SazUvg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d76ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491If1Y2028642
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8888hp3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCvqXg/SnIA45vfDGJVAt03qykpw6cJf14/7y/4HzMlTL7XKMMwvLHFPWBKyIcUgHJjGxsBJwcA3GvwYJIOP73PA8vmuDdHecFKhVsDwOcgm4JTXFTE+P01bqX9pvYfUNmvU0/h18iAILvvB9/5ubqMviYGE+IMd40oDPX/mTHuUGn8clyXO+nRIzyfMRM/HF9aN9HeGRfELDqnWvWRqYYozDZ+yyoehoH2QBNj++eXpNoddTixH1vFEvS23GpfE/UXi7P2JuayDgvrim0/Nk1LSD01M7wipiLvMDaqBbzJeJyEX7mSouccgCtTp3rUWZlfNnRfiBxH+9dK05akpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTxuVuAvBGfVXtGWmPW3h3eEcBugpnaHn1cHP32Wt9A=;
 b=MoYy5EYqVBFhyP2vXg4sCW7T73m/5FVuRDK4ssC9QWi+FuLoqhLl2xnhgB5oL16hCFpBw7u1TXMKEMx1UOk2IKrtM6UdEGte/axiVLqCevzVdiOJPbh61nHZAk1TOFWP5v/d5CejxEQvE6QZf7KupEuHJyv/wTxe7eh91UjXFoKrnkinqpqt5jR3TtEhk2Kj9WuwPdSaTDey78Txe3kYGCQ+2qMrYZlF3/q/WDR4ck7CCWcPJGtE5G3gKUVw/JH6LKqMqCBDLJF4OT814/5/oTPmkBlhe/We3PTBEXdRnoimQ7XXajPjlaIoaVZQMzb2/1oivaIFQJ+RWyeOMJvPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTxuVuAvBGfVXtGWmPW3h3eEcBugpnaHn1cHP32Wt9A=;
 b=ITtKYLjfrBqmpS01b6mGK1Mo6CVlgWp05bIzvTwYGOcyuYuESN2/ql2KN/yyIA6nNpJj+SAGGF8vsZ3ehHi8GgNw7INRfoZCiO00Siw9sLCeK+9l2XNQCtbkwxFkkz7KPGGyzcp7aTLay4Oy6pVJ3MXhAE7KYUNvmK+uibkPcKo=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CH2PR10MB4133.namprd10.prod.outlook.com (2603:10b6:610:a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 19:55:02 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 19:55:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Tomas Jedlicka <tomas.jedlicka@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 1/2] ctf: generate CTF information for the kernel
Date: Tue,  1 Oct 2024 20:54:51 +0100
Message-ID: <20241001195452.223321-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241001195452.223321-1-nick.alcock@oracle.com>
References: <20241001195452.223321-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CH2PR10MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: bed05b8b-fd2d-4d10-ee41-08dce252efef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1eRi3zHxWPDv6mTtMPBc1zXkWEa8fUCJEYmPVf3XQFJ3z8m03/yADB1oGV6I?=
 =?us-ascii?Q?Y28QkmmDuWSpVbgF77jk6D3sN90+bMKBTdqQI0EiEryPV/Bzr66OMLAtGdQq?=
 =?us-ascii?Q?7zs/p9J1B0dZP7gZacu0t/4h/NX7jOmSGG2OaJOP3+wG1Av0JuovVmDuxePg?=
 =?us-ascii?Q?dVnv/AtZbbMF4kxpHZ9GJERh+VC6ADXhbX6G9uf44zPuItphyyPIRbWSDnn/?=
 =?us-ascii?Q?s6mW5z9bHrYlu6nw0HN26/4MT1/1nYv0fOJ5lncre8ocnPBN+cHK94eFrsWv?=
 =?us-ascii?Q?j/oE7q6u6eA2aXYWiB+lbCGJeWfGUj7NHv3zSnb9okGs/fhG/kTDgRYBG6M1?=
 =?us-ascii?Q?MsELZl5+1IJnD5bqv71q8NUyCuxkEU6gkz0W4PL+3IryqxCpn1cFIfYU139k?=
 =?us-ascii?Q?uGgYLOqWTv9AIsjqBa3/iF8sUlCof1Cggfc1LV7l8fE1+vjmJx5e8CU46cmz?=
 =?us-ascii?Q?LVpYnEBgoX7q0HtpukyPcM0KEmath0rxGYKIn0auUNkqNAhzAol6l+w7b/w2?=
 =?us-ascii?Q?lI4mMQTtqTXtBCVY7OF51Dm7mhcMqDT2fSKDeHT9rIf+r+mwUkjYxuCrP6uY?=
 =?us-ascii?Q?1f6XyAmYeYsUpqvKRuOXjdXgv/xmn6IVb8QKe0A0tI88OFIbuLYa53qOAxNP?=
 =?us-ascii?Q?scppBIAOuZT9l49GwXKI732FV0Xtt2Y1/7ioqPiJ++aUGOQUxGzKpFOlF57u?=
 =?us-ascii?Q?WMIwNlGyX+s9xVu9kW7uWe9eBWHGDzUmKcVp68iPJqXxZ9gBkWfVrbo/AKHT?=
 =?us-ascii?Q?kazKAS26kgEsGfbWVYatuGSns93qpOX2I4UeHoUi0/eaWiopAzPtkaT1CmS0?=
 =?us-ascii?Q?6q3zZPY2zGh5m+fs+4eD11RYuGORL5/yvAwcO0ciKD/PmCB/QqjY9Rg7f5LN?=
 =?us-ascii?Q?EqhQrCGGXAfXXPoA8b76zCuFGuGPNdZ/G2z0fRo8jTK9mNRGwuN/+hVe3Uyk?=
 =?us-ascii?Q?qt/ZKhWsLufO8MF9wEZzhmJEuBEi742wWn5G7r/tmyU15KzluagmyEhVKcTH?=
 =?us-ascii?Q?J8i30uaoB/HQwPg8BObQM4tJ5LHKkyzljwbg2JgOHr83USt1qEZc7qzdkBmv?=
 =?us-ascii?Q?Z79WqdUGX1VnuFbkRATjmGbq0+QmCM/Zo/R1X0IT5OAZEAcb2g/RE/FBeecO?=
 =?us-ascii?Q?6+qtukzIpkGd9zwR2MrAtdVj/ejQkyIpV/2PWtUTHpGo8Nsv33UslNuNJA6G?=
 =?us-ascii?Q?Hg0TiYUpTahU6o3JMVz74+5qouGJb2FE7oS+k3n50LgUN6EookklOI5h3Nqd?=
 =?us-ascii?Q?eVES6nCzPHxCTAyiFXtVGMPthHyS9HgvhIuFYjDfFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCDVYIr9mTEjij3XnnxGTGGUHAUT6UJpBa0aNKc6u3DxCA2LF0EOLEJr2nII?=
 =?us-ascii?Q?sy9eE5i6EVHWv9ICBUNTE+FSNMHr/OPQprRLmwKOFoyVAF3M0BvFuX5HtiSx?=
 =?us-ascii?Q?lGJf7/rWlA3ZqIx+jVGCThJooRFfMlyyJaRTNLWaGQjesXKQCa5uIiGfehhq?=
 =?us-ascii?Q?qy/RrshiA5Y0QggRSxWiTaii/boDmIIBJDsfHbhczZJLsN5HY32QBpH6jbpL?=
 =?us-ascii?Q?UbSN11XqSjeUBtQTEH47b+uVe1FtyvH1bBx7odUxuoz56Xr7IkhKUUefviND?=
 =?us-ascii?Q?jtT2S3Mo45aXFAYlCCQF5jXxuOeox6Jq7x6KMX5v0BpvNzeeF4JabtueGukW?=
 =?us-ascii?Q?zRWAHDKq3r34VNcqUp/kHsRdLxT5p9nzmyRnofFQ7ZzSxnthIm/gyF0LHbQF?=
 =?us-ascii?Q?VWf8Vb61np+1lFKfZSzzNIZNUzmHPTQpxuWe5IDpCYw9Wl94HZtuy6NNuqEI?=
 =?us-ascii?Q?uSotGUKIKnNI0whkoSnOC1Brua50/+zV5sFilnguqoHLFbkUkLezPagohVgA?=
 =?us-ascii?Q?jiQkxyEmuISeVBgJeQWnmn38J9Aj4YJDRX29yNZ87pMcHYjhecRRa0d4VE23?=
 =?us-ascii?Q?LKANCy8XM4kchakvcfRpfQlS+qheg9GIEuRtUnBnvuE2FmNYsymOnsFpOb8f?=
 =?us-ascii?Q?pQ0+PYZknVesi9IdzPA2R5ijGZvuv6LJO+J/YKwNQXf+FOKcJCl0w+jbCUV4?=
 =?us-ascii?Q?UN3CB4V+CO6eT/WoVraVQP/O/CAb9iQQCLvEK9tI9e0vMHjwtpkql4E+WJZN?=
 =?us-ascii?Q?BtOwqn+IFkTp+P2ciDHg2cm3yYYNwK5v3DlLx6BUsmEa/6AjN49UrqB7IHQf?=
 =?us-ascii?Q?XYGp48PEVy5Q2wnEDu8RgqFC/Cecb/wa9Vyt0bR+VgnLcOuD0OoASPCJPwhc?=
 =?us-ascii?Q?38W2WWhSgxRENb+EuT+m2NmjlJkP8ssmE/usYObd/q3uU5+8qUDR2WrgGH/d?=
 =?us-ascii?Q?iPSGaGOGtfpCqiWloAjPfdrjwPWyGvj59hNUV406LgOM1Evaq81VdihpHUch?=
 =?us-ascii?Q?JRmcJdd+z6pWO9up0zygV7HY5OJohTDRZpRrs3XjOgHSNpdzlZyAXITX8gWr?=
 =?us-ascii?Q?QAwpDjwKc8Ps7Gdp1fctRKLuFJltDqAM6WLEZfL7hvW0hapZYoxWGv/xC7AB?=
 =?us-ascii?Q?aAvdDzrad8gh/hF38jynE32QyWn0u3bdxDShs+0C7x32KfCDAKq27vuOahbK?=
 =?us-ascii?Q?dlSlVmC1vSzOSH3dXPb/JZRzRRMSW19zg7e2UO+E62B/HjeUqditNbGGMdHZ?=
 =?us-ascii?Q?s5a84VTeOYMhjTQeXJuJPVO3Gs6fiRVT4TxnIdRdZR1Pof0BVtqLI6neUrtj?=
 =?us-ascii?Q?MY82wQoMn/G+DoXNK/ke3oDwTTNith0X38yQrDwBk4wC7Z5HkFaj9Z2ki/Zw?=
 =?us-ascii?Q?IftJVuX8EiYFc4pflA+H9reY5tS4AKpN99DuZfp565tNSW2kj3HtKBfbKeOl?=
 =?us-ascii?Q?Rlv/j1rsa6aKZZQ2j0313P/wxrGKpnO+lSK6d30nhyfwPDDmy4Lsm4+ESERg?=
 =?us-ascii?Q?m8kDeWtsyJ4kF4Q0ThNM7K6yd4dujtIDZMkQiOTDnpNauzaaeJTgrMzPT/Df?=
 =?us-ascii?Q?Y/FvjNcYFarB7BrR+3lWwedIk7NO4V2PrK+nRpbEEoW2Ef1BmGf6RuTc8d5q?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e9jGx/GAwsFvXMpoDX0uXZDcPcqjrTM7+potJlW9ipMaNogtaOwaYIM9uxHTb2/zJMusHAsGiTmphYOrJ+05XbmjBEosuBzpsoJ1cvTlGxxdBEwtHeutJyrBJ2yKajX0ufnQrH6uRnbE9ZgvQQe2L+c8eZ61hvky01OVaOpxaLYckwJP6F0eC7p5ntGXVTHbjKb1OvL00kF7dCtwkgLe1hiYTITrrG6xtIWqz2/5QP5cTZoEfijhCYfj3Lw5TEyaiezR+a5a+d7EKnwKT0Cusrc52mRYd22rOhUDS8Jl3yeRF1gdBJV8XyAliUjRKiWQ1rebg4kbOF9o4SoplYhM0I/kcdJuQV6Qd/TyG4q2uGb08OMzpd+tl6zmuJjZ75O6og7o0JuD4asuc+xyj9hSFHNJnw7ehg6wj4o8UyFCWcGLtehN0De6ycY7YsFIYm6Z9/8Z55PAemFN1LhgeQalJNbxiiU40saVTIbMjkKRAB7zk+6o3prnPU9lJo4gbLYAKEaViI0SzuK65asy05AycSi2AYSXezH1oMKWLEICMOyIll/1s9JfOpdSkQYxivAYnyLpuRSa+nCkLFa3W4GQu865l8ZbKrUBlM5XjGO4b90=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed05b8b-fd2d-4d10-ee41-08dce252efef
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:55:02.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTY/Q1zKTDTt+INNSya3+IKW6QbTtKpti3utv8efq2+vwPUNHUSBvCY//5O4RsTQlsNJbk8nuBRwoPi4ErP7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4133
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410010130
X-Proofpoint-GUID: UOiBF3yN3qMtV5lWHNPGeBNQJC-csTJp
X-Proofpoint-ORIG-GUID: UOiBF3yN3qMtV5lWHNPGeBNQJC-csTJp

This introduces a new config option, CONFIG_CTF, which causes the
compiler to be run with -gctf to emit information on the kernel's types
and global variables, and a tool, ctfarchive, which runs whenever
'make ctf' is run, deduplicating that information into a mmappable
type archive named vmlinux.ctfa, which is installed at 'make ctf_install'
time into /lib/modules/$(uname -r)/kernel/.  You can view the contents of
this archive via

objdump --ctf --ctf-parent=shared_ctf /lib/modules/$(uname -r)/kernel/vmlinux.ctfa

from binutils 2.41+ (but only binutils 2.35+ is needed for generation).

Out-of-tree modules cannot participate in this mechanism since vmlinux.ctfa
is already written: so, as happens for normal userspace binaries, the compiler
emits .ctf sections into the modules themselves, and the linker deduplicates
them.  strip does not strip such sections out, but additional care should be
taken not to strip such sections into debug RPMs (they are small enough that
this should not be a problem).

For in-tree modules and the core kernel, ctfarchive uses the same code (in
libctf) to do the deduplication into vmlinux.ctfa as the linker does for
out-of-tree modules and userspace code compiled with -gctf: there is
no code duplication.

Within the ctfa file, the type information is divided into a shared
repository, containing all types used by more than one module, CTF for
the core kernel, and separate CTF for each module built, whether or not
this module has been compiled in or not: if a file *could* be built as a
module, it will be considered to be a module from the perspective of CTF
file emission.  This ensures that external consumers such as DTrace
always find types for a given module in the same place, regardless of
the local kernel configuration, as long as that module is present at
all, assisting in portability of D scripts between installations.

This process needs a mapping from the names of object files to the modules
that make them up, so we compute such a mapping (under the name
.tmp_module.objnames) by scanning the .cmd files left behind by the build
process and filtering it using modules.builtin: see
scripts/ctf-module-objnames.sh.  We add an iterator over these in
scripts/module_objnames.c: it's not in scripts/ctf purely because the
general idea has nothing much to do with CTF, but I'm happy to migrate it
into scripts/ctf if wanted.

We use separate targets for CTF deduplication and installation so that
you don't pay the cost of cross-module CTF deduplication while iterating
on kernel development, and so that ordinary kernel make install targets
don't surprise scripts with extra files.  I could be convinced that it
makes more sense to install the CTF via make install iff it exists.

One downside of separating make modules_install and make ctf_install
is that since make modules_install deletes /lib/modules/$(uname -r),
make ctf_install only has an effect if you run it after make modules_install,
not before.

This introduces new kernel build-time dependencies on a sufficiently new
binutils, a CTF-capable GCC, and libctf: if any of these is not found,
CONFIG_CTF is disabled and all this machinery has no effect.  Even if it
is turned on, in the absence of 'make ctf', the CTF is deduplicated into
the modules and then stripped from them and discarded; and in the absence
of 'make ctf_install', the deduplicated vmlinux.ctfa is not installed.

Source-wise, outside of various places turning CTF off where not desired
(mostly the vDSO), and deleting the CTF from the final modules and kernel,
there is hardly any impact to the existing source tree: the new rules are
mostly centralized in a new scripts/Makefile.ctfa and
scripts/Makefile.ctfa-toplevel, and a small utility 'ctfarchive' to do the
final deduplication.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Tomas Jedlicka <tomas.jedlicka@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
 .gitignore                        |   2 +
 Documentation/process/changes.rst |   3 +
 Makefile                          |   8 +-
 arch/arm/vdso/Makefile            |   4 +
 arch/arm64/kernel/vdso/Makefile   |   4 +
 arch/loongarch/vdso/Makefile      |   3 +-
 arch/mips/vdso/Makefile           |   3 +-
 arch/sparc/vdso/Makefile          |   2 +-
 arch/x86/entry/vdso/Makefile      |   2 +
 arch/x86/um/vdso/Makefile         |   2 +-
 include/asm-generic/vmlinux.lds.h |   1 +
 init/Kconfig                      |   6 +
 lib/Kconfig                       |  11 ++
 scripts/.gitignore                |   1 +
 scripts/Makefile                  |   1 +
 scripts/Makefile.ctfa             |  92 ++++++++++
 scripts/Makefile.ctfa-toplevel    |  51 ++++++
 scripts/Makefile.modfinal         |   7 +-
 scripts/Makefile.vmlinux_o        |  20 +-
 scripts/ctf-module-objnames.sh    |  35 ++++
 scripts/ctf/.gitignore            |   1 +
 scripts/ctf/Makefile              |   5 +
 scripts/ctf/ctfarchive.c          | 295 ++++++++++++++++++++++++++++++
 scripts/ctf/module_objnames.c     |   2 +
 scripts/ctf/module_objnames.h     |   2 +
 scripts/mod/modpost.c             |   1 +
 scripts/module_objnames.c         | 160 ++++++++++++++++
 scripts/module_objnames.h         |  48 +++++
 scripts/package/kernel.spec       |   6 +
 scripts/package/mkspec            |   5 +
 scripts/remove-ctf-lds.awk        |  12 ++
 31 files changed, 785 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.ctfa
 create mode 100644 scripts/Makefile.ctfa-toplevel
 create mode 100755 scripts/ctf-module-objnames.sh
 create mode 100644 scripts/ctf/.gitignore
 create mode 100644 scripts/ctf/Makefile
 create mode 100644 scripts/ctf/ctfarchive.c
 create mode 100644 scripts/ctf/module_objnames.c
 create mode 100644 scripts/ctf/module_objnames.h
 create mode 100644 scripts/module_objnames.c
 create mode 100644 scripts/module_objnames.h
 create mode 100644 scripts/remove-ctf-lds.awk

diff --git a/.gitignore b/.gitignore
index 56972adb5031..f2c1c3367431 100644
--- a/.gitignore
+++ b/.gitignore
@@ -16,6 +16,7 @@
 *.bin
 *.bz2
 *.c.[012]*.*
+*.ctf
 *.dt.yaml
 *.dtb
 *.dtbo
@@ -64,6 +65,7 @@ modules.order
 /vmlinux.32
 /vmlinux.map
 /vmlinux.symvers
+/vmlinux.ctfa
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 00f1ed7c59c3..a8baff63b44a 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -65,9 +65,12 @@ gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
 Python (optional)      3.5.x            python3 --version
 GNU AWK (optional)     5.1.0            gawk --version
+GNU C\ [#f2]_          12.0             gcc --version
+binutils\ [#f2]_       2.36             ld -v
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
+.. [#f2] These are needed at build-time when CONFIG_CTF is enabled
 
 Kernel compilation
 ******************
diff --git a/Makefile b/Makefile
index 187a4ce2728e..9737c601ad39 100644
--- a/Makefile
+++ b/Makefile
@@ -1019,6 +1019,7 @@ include-$(CONFIG_UBSAN)		+= scripts/Makefile.ubsan
 include-$(CONFIG_KCOV)		+= scripts/Makefile.kcov
 include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
+include-$(CONFIG_CTF)		+= scripts/Makefile.ctfa-toplevel
 
 include $(addprefix $(srctree)/, $(include-y))
 
@@ -1494,7 +1495,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       modules.builtin.ranges vmlinux.o.map \
 	       compile_commands.json rust/test \
-	       rust-project.json .vmlinux.objs .vmlinux.export.c
+	       rust-project.json .vmlinux.objs .vmlinux.export.c \
+	       vmlinux.ctfa
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1588,6 +1590,8 @@ help:
 	@echo  '                    (requires a recent binutils and recent build (System.map))'
 	@echo  '  dir/file.ko     - Build module including final link'
 	@echo  '  modules_prepare - Set up for building external modules'
+	@echo  '  ctf             - Generate CTF type information, installed by make ctf_install'
+	@echo  '  ctf_install     - Install CTF to INSTALL_MOD_PATH (default: /)'
 	@echo  '  tags/TAGS	  - Generate tags file for editors'
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  gtags           - Generate GNU GLOBAL index'
@@ -1944,7 +1948,7 @@ clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find $(or $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
-		-o -name '*.ko.*' \
+		-o -name '*.ko.*' -o -name '*.ctf' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
 		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
 		-o -name '*.dt.yaml' -o -name 'dtbs-list' \
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 01067a2bc43b..d2193b8dfad8 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -14,6 +14,10 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 ccflags-y := -fPIC -fno-common -fno-builtin -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO32
 
+# CTF in the vDSO would introduce a new section, which would
+# expand the vDSO to more than a page.
+ccflags-y += $(call cc-option,-gctf0)
+
 ldflags-$(CONFIG_CPU_ENDIAN_BE8) := --be8
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	    -z max-page-size=4096 -shared $(ldflags-y) \
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 35685c036044..894258136450 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -33,6 +33,10 @@ ldflags-y += -T
 ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
 ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 
+# CTF in the vDSO would introduce a new section, which would
+# expand the vDSO to more than a page.
+ccflags-y += $(call cc-option,-gctf0)
+
 # -Wmissing-prototypes and -Wmissing-declarations are removed from
 # the CFLAGS to make possible to build the kernel with CONFIG_WERROR enabled.
 CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 40c1175823d6..0ab86476ea45 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -22,7 +22,8 @@ cflags-vdso := $(ccflags-vdso) \
 	-O2 -g -fno-strict-aliasing -fno-common -fno-builtin \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
-	$(call cc-option, -fno-stack-protector)
+	$(call cc-option, -fno-stack-protector) \
+	$(call cc-option,-gctf0)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b289b2c1b294..6c8d777525f9 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -30,7 +30,8 @@ cflags-vdso := $(ccflags-vdso) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
-	$(call cc-option, -fno-asynchronous-unwind-tables)
+	$(call cc-option, -fno-asynchronous-unwind-tables) \
+	$(call cc-option,-gctf0)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 243dbfc4609d..e4f3e47074e9 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -44,7 +44,7 @@ $(obj)/vdso-image-%.c: $(obj)/vdso%.so.dbg $(obj)/vdso%.so $(obj)/vdso2c FORCE
 CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64 \
        $(filter -g%,$(KBUILD_CFLAGS)) -fno-stack-protector \
        -fno-omit-frame-pointer -foptimize-sibling-calls \
-       -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
+       $(call cc-option,-gctf0) -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 
 SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
 
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index c9216ac4fb1e..fbbf4de9ff8e 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -54,6 +54,7 @@ $(obj)/vdso-image-%.c: $(obj)/vdso%.so.dbg $(obj)/vdso%.so $(obj)/vdso2c FORCE
 CFL := $(PROFILING) -mcmodel=small -fPIC -O2 -fasynchronous-unwind-tables -m64 \
        $(filter -g%,$(KBUILD_CFLAGS)) -fno-stack-protector \
        -fno-omit-frame-pointer -foptimize-sibling-calls \
+       $(call cc-option,-gctf0) \
        -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 
 ifdef CONFIG_MITIGATION_RETPOLINE
@@ -132,6 +133,7 @@ KBUILD_CFLAGS_32 += -m32 -msoft-float -mregparm=0 -fpic
 KBUILD_CFLAGS_32 += -fno-stack-protector
 KBUILD_CFLAGS_32 += $(call cc-option, -foptimize-sibling-calls)
 KBUILD_CFLAGS_32 += -fno-omit-frame-pointer
+KBUILD_CFLAGS_32 += $(call cc-option,-gctf0)
 KBUILD_CFLAGS_32 += -DDISABLE_BRANCH_PROFILING
 
 ifdef CONFIG_MITIGATION_RETPOLINE
diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 6a77ea6434ff..6db233b5edd7 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -40,7 +40,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 #
 CFL := $(PROFILING) -mcmodel=small -fPIC -O2 -fasynchronous-unwind-tables -m64 \
        $(filter -g%,$(KBUILD_CFLAGS)) -fno-stack-protector \
-       -fno-omit-frame-pointer -foptimize-sibling-calls
+       -fno-omit-frame-pointer -foptimize-sibling-calls $(call cc-option,-gctf0)
 
 $(vobjs): KBUILD_CFLAGS += $(CFL)
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeadbaeccf88..6cfb06659d01 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1012,6 +1012,7 @@
 	*(.discard.*)							\
 	*(.export_symbol)						\
 	*(.modinfo)							\
+	*(.ctf)								\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
 
diff --git a/init/Kconfig b/init/Kconfig
index fbd0cb06a50a..4a6614f4f453 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -120,6 +120,12 @@ config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
 
+config HAVE_CTF_TOOLCHAIN
+	def_bool $(cc-option,-gctf) && $(success,$(LD) $(KBUILD_LDFLAGS) -lbfd -liberty -lctf -lbfd -liberty -lz -ldl -lc -o /dev/null)
+	depends on CC_IS_GCC
+	help
+	  GCC and binutils support CTF generation.
+
 config CONSTRUCTORS
 	bool
 
diff --git a/lib/Kconfig b/lib/Kconfig
index b38849af6f13..d449c7652cda 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -634,6 +634,17 @@ config DIMLIB
 #
 config LIBFDT
 	bool
+#
+# CTF support is select'ed if needed
+#
+config CTF
+        bool "Compact Type Format generation"
+        default y
+        depends on HAVE_CTF_TOOLCHAIN
+        help
+          Emit a compact, compressed description of the kernel's datatypes and
+          global variables into the vmlinux.ctfa archive (for in-tree modules)
+          or into .ctf sections in kernel modules (for out-of-tree modules).
 
 config OID_REGISTRY
 	tristate
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 3dbb8bb2457b..434e5da6c75f 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -11,3 +11,4 @@
 /sorttable
 /target.json
 /unifdef
+!/Makefile.ctf
diff --git a/scripts/Makefile b/scripts/Makefile
index 6bcda4b9d054..52739793ba3e 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -54,6 +54,7 @@ targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_CTF)         += ctf
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
 
diff --git a/scripts/Makefile.ctfa b/scripts/Makefile.ctfa
new file mode 100644
index 000000000000..1bcdeda375dd
--- /dev/null
+++ b/scripts/Makefile.ctfa
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# ===========================================================================
+# Module CTF/CTFA generation
+# ===========================================================================
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+
+# CTF is already present in every object file if CONFIG_CTF is enabled.
+# vmlinux.lds.h strips it out of the finished kernel, but if nothing is done
+# it will be deduplicated into module .ko's.  For out-of-tree module builds,
+# this is what we want, but for in-tree modules we can save substantial
+# space by deduplicating it against all the core kernel types as well.  So
+# split the CTF out of in-tree module .ko's into separate .ctf files so that
+# it doesn't take up space in the modules on disk, and let the specialized
+# ctfarchive tool consume it and all the CTF in the vmlinux.o files when
+# 'make ctf' is invoked, and use the same machinery that the linker uses to
+# do CTF deduplication to emit vmlinux.ctfa containing the deduplicated CTF.
+
+# Nothing special needs to be done if CTF is turned off or if a standalone
+# module is being built.
+module-ctf-postlink = mv $(1).tmp $(1)
+
+ifdef CONFIG_CTF
+
+# This is quite tricky.  The CTF machinery needs to be told about all the
+# built-in objects as well as all the external modules -- but Makefile.modfinal
+# only knows about the latter.  So the toplevel makefile emits the names of the
+# built-in objects into a temporary file, which is then catted and its contents
+# used as prerequisites by this rule.
+#
+# We write the names of the object files to be scanned for CTF content into a
+# file, then use that, to avoid hitting command-line length limits.
+
+ifeq ($(KBUILD_EXTMOD),)
+ctf-modules := $(shell find . -name '*.ko.ctf' -print)
+quiet_cmd_ctfa_raw = CTFARAW
+      cmd_ctfa_raw = scripts/ctf/ctfarchive $@ .tmp_objects.builtin .tmp_module.objnames $(ctf-filelist)
+ctf-builtins := .tmp_objects.builtin
+ctf-filelist := .tmp_ctf.filelist
+ctf-filelist-raw := .tmp_ctf.filelist.raw
+
+define module-ctf-postlink =
+	$(OBJCOPY) --only-section=.ctf $(1).tmp $(1).ctf && \
+	$(OBJCOPY) --remove-section=.ctf $(1).tmp $(1) && rm -f $(1).tmp
+endef
+
+# Split a list up like shell xargs does.
+define xargs =
+$(1) $(wordlist 1,1024,$(2))
+$(if $(word 1025,$(2)),$(call xargs,$(1),$(wordlist 1025,$(words $(2)),$(2))))
+endef
+
+$(ctf-filelist-raw): $(ctf-builtins) $(ctf-modules)
+	@rm -f $(ctf-filelist-raw);
+	$(call xargs,@printf "%s\n" >> $(ctf-filelist-raw),$^)
+	@touch $(ctf-filelist-raw)
+
+$(ctf-filelist): $(ctf-filelist-raw)
+	@rm -f $(ctf-filelist);
+	@cat $(ctf-filelist-raw) | while read -r obj; do \
+		case $$obj in \
+		$(ctf-builtins)) cat $$obj >> $(ctf-filelist);; \
+		*.a) ar t $$obj > $(ctf-filelist);; \
+		*.builtin) cat $$obj >> $(ctf-filelist);; \
+		*) echo "$$obj" >> $(ctf-filelist);; \
+		esac; \
+	done
+	@touch $(ctf-filelist)
+
+# The raw CTF depends on the output CTF file list, and that depends
+# on the .ko files for the modules.
+.tmp_vmlinux.ctfa.raw: $(ctf-filelist) FORCE
+	$(call if_changed,ctfa_raw)
+
+quiet_cmd_ctfa = CTFA
+      cmd_ctfa = { echo 'int main () { return 0; } ' | \
+		gcc -x c -c -o $<.stub -; \
+	$(OBJCOPY) '--remove-section=.*' --add-section=.ctf=$< \
+		 $<.stub $@; }
+
+# The CTF itself is an ELF executable with one section: the CTF.  This lets
+# objdump work on it, at minimal size cost.
+vmlinux.ctfa: .tmp_vmlinux.ctfa.raw FORCE
+	$(call if_changed,ctfa)
+
+targets += vmlinux.ctfa
+
+endif		# KBUILD_EXTMOD
+
+endif		# !CONFIG_CTF
+
diff --git a/scripts/Makefile.ctfa-toplevel b/scripts/Makefile.ctfa-toplevel
new file mode 100644
index 000000000000..29416c9c07ce
--- /dev/null
+++ b/scripts/Makefile.ctfa-toplevel
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# ===========================================================================
+# CTF rules for the top-level makefile only
+# ===========================================================================
+
+KBUILD_CFLAGS	+= $(call cc-option,-gctf)
+KBUILD_LDFLAGS	+= $(call ld-option, --ctf-variables)
+
+ifeq ($(KBUILD_EXTMOD),)
+
+# CTF generation for in-tree code (modules, built-in and not, and core kernel)
+
+# This contains all the object files that are built directly into the
+# kernel (including built-in modules), for consumption by ctfarchive in
+# Makefile.modfinal.  Make sure that all lines that are not absolute paths
+# start with a ./ (for consistency with .tmp_ctf.filelist).
+# We sort it after the fact to eliminate duplicates (there are quite a lot).
+.tmp_objects.builtin: vmlinux.a $(KBUILD_VMLINUX_LIBS)
+	$(Q)for archive in $^; do \
+		$(AR) t "$$archive" >> $@.unsorted; \
+	done; \
+	sed -i '/^[^/]/s,^\([^\.]\),./\1,' $@.unsorted; \
+	sort -u < $@.unsorted > $@; \
+	rm -f $@.unsorted
+
+# This contains a mapping from module name to object file name for all
+# objects named in .tmp_objects.builtin.
+# Extract possible module names from the command-lines used to
+# compile the modules, filter them by the set of actual built-in modules
+# in modules.builtin
+.tmp_module.objnames: .tmp_objects.builtin modules.builtin
+	$(Q)$(srctree)/scripts/ctf-module-objnames.sh $@
+
+ctf: vmlinux.ctfa
+PHONY += ctf ctf_install
+
+# Making CTF needs the builtin files.  We need to force everything to be
+# built if not already done, since we need the .o files for the machinery
+# above to work.
+vmlinux.ctfa: KBUILD_BUILTIN := 1
+vmlinux.ctfa: .tmp_objects.builtin .tmp_module.objnames
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal vmlinux.ctfa
+
+ctf_install:
+	$(Q)mkdir -p $(MODLIB)/kernel
+	@ln -sf $(abspath $(srctree)) $(MODLIB)/source
+	$(Q)cp -f $(objtree)/vmlinux.ctfa $(MODLIB)/kernel
+
+CLEAN_FILES += vmlinux.ctfa
+
+endif
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 1482884ec3ca..cf87ae7e6fa1 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -33,11 +33,16 @@ quiet_cmd_cc_o_c = CC [M]  $@
 $(extmod_prefix).module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
+# for module-ctf-postlink
+include $(srctree)/scripts/Makefile.ctfa
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T scripts/module.lds -o $@ $(filter %.o, $^)
+		-T scripts/module.lds $(LDFLAGS_$(modname)) -o $@.tmp	\
+		$(filter %.o, $^) &&					\
+	$(call module-ctf-postlink,$@)					\
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 0b6e2ebf60dc..70d508288b32 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -27,6 +27,18 @@ ifdef CONFIG_LTO_CLANG
 initcalls-lds := .tmp_initcalls.lds
 endif
 
+# Generate a linker script to delete CTF sections
+# -----------------------------------------------
+
+quiet_cmd_gen_remove_ctf.lds = GEN     $@
+      cmd_gen_remove_ctf.lds = \
+	$(LD) -r --verbose | awk -f $(real-prereqs) > $@
+
+.tmp_remove-ctf.lds: $(srctree)/scripts/remove-ctf-lds.awk FORCE
+	$(call if_changed,gen_remove_ctf.lds)
+
+targets := .tmp_remove-ctf.lds
+
 # objtool for vmlinux.o
 # ---------------------------------------------------------------------------
 #
@@ -42,7 +54,9 @@ vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
 
 objtool-args = $(vmlinux-objtool-args-y) --link
 
-# Link of vmlinux.o used for section mismatch analysis
+# Link of vmlinux.o used for section mismatch analysis: we also strip the CTF
+# section out at this stage, since ctfarchive gets it from the underlying object
+# files and linking it further is a waste of time.
 # ---------------------------------------------------------------------------
 
 vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
@@ -51,7 +65,7 @@ quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
 	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
 	$(vmlinux-o-ld-args-y) \
-	$(addprefix -T , $(initcalls-lds)) \
+	$(addprefix -T , $(initcalls-lds)) -T .tmp_remove-ctf.lds \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
 	$(cmd_objtool)
@@ -61,7 +75,7 @@ define rule_ld_vmlinux.o
 	$(call cmd,gen_objtooldep)
 endef
 
-vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) .tmp_remove-ctf.lds FORCE
 	$(call if_changed_rule,ld_vmlinux.o)
 
 targets += vmlinux.o
diff --git a/scripts/ctf-module-objnames.sh b/scripts/ctf-module-objnames.sh
new file mode 100755
index 000000000000..4fc8f24b8888
--- /dev/null
+++ b/scripts/ctf-module-objnames.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0+
+# Produce a file mapping module names to object file names for all built-in
+# modules in the kernel.  Used by ctfarchive.
+
+set -e
+
+# Translate e.g. ./lib/zstd/common/entropy_common.o into
+# ./lib/zstd/common/.entropy_common.o.cmd, and extract the module name from
+# that.
+
+sed 's,^\(.*/\)\(.*\)$,\1.\2.cmd,g' .tmp_objects.builtin |\
+    xargs grep -o -- '-DKBUILD_MODNAME=[^ ]*' | \
+    # Translate e.g. ./lib/zstd/common/.entropy_common.o.cmd:
+    # -KDBUILD_MODNAME='"zstd_common"' into zstd_common
+    # ./lib/zstd/common/entropy_common.o, and sort the result so the same module
+    # always occupies consecutive lines.
+    sed 's,^\([^:]*/\)\.\([^:]*\).cmd.*-DKBUILD_MODNAME=."\([^"]*\)".*$,\3 \1\2,' | sort -k1 | \
+    # Accumulate filename portions for the same module into one line.
+    awk -F ' ' 'BEGIN { mod=""; objs="";}
+                $1 != mod { printf ("%s %s\n", mod, objs); mod=$1; objs=""; }
+                { objs=objs $2 " "; }
+                END { printf ("%s %s\n", mod, objs); }' > .tmp_possible_modobjs
+
+# Filter out the maybe-module names from this list, and sort them.
+sed 's, .*,,' < .tmp_possible_modobjs | sort -u -k 1b,1 > .tmp_possible_modules
+
+# Filter the list of possible modules by the list of modules actually in the
+# kernel, then use that to exclude non-modules from the list we computed
+# earlier.  Trim off trailing spaces, to help the iterator in
+# modules_builtin.c.  Complicated a bit by the need to trim off the leading
+# kernel/ from modules.builtin.
+sed 's,^.*/\([^/]*\)\.ko$,\1,' modules.builtin | sort -u -k 1b,1 | \
+    comm - .tmp_possible_modules -12 | join -j 1 - .tmp_possible_modobjs | \
+    sed 's, *$,,'> $1
diff --git a/scripts/ctf/.gitignore b/scripts/ctf/.gitignore
new file mode 100644
index 000000000000..6a0eb1c3ceea
--- /dev/null
+++ b/scripts/ctf/.gitignore
@@ -0,0 +1 @@
+ctfarchive
diff --git a/scripts/ctf/Makefile b/scripts/ctf/Makefile
new file mode 100644
index 000000000000..cddf9710ef55
--- /dev/null
+++ b/scripts/ctf/Makefile
@@ -0,0 +1,5 @@
+ifdef CONFIG_CTF
+hostprogs-always-y	:= ctfarchive
+ctfarchive-objs		:= ctfarchive.o module_objnames.o
+HOSTLDLIBS_ctfarchive := -lctf
+endif
diff --git a/scripts/ctf/ctfarchive.c b/scripts/ctf/ctfarchive.c
new file mode 100644
index 000000000000..a852856ee676
--- /dev/null
+++ b/scripts/ctf/ctfarchive.c
@@ -0,0 +1,295 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ctfmerge.c: Read in CTF extracted from generated object files from a
+ * specified directory and generate a CTF archive whose members are the
+ * deduplicated CTF derived from those object files, split up by kernel
+ * module.
+ *
+ * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#define _GNU_SOURCE 1
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <ctf-api.h>
+#include "module_objnames.h"
+
+static ctf_file_t *output;
+
+static int private_ctf_link_add_ctf(ctf_file_t *fp,
+				    const char *name)
+{
+#if !defined (CTF_LINK_FINAL)
+	return ctf_link_add_ctf(fp, NULL, name);
+#else
+	/* Non-upstreamed, erroneously-broken API.  */
+	return ctf_link_add_ctf(fp, NULL, name, NULL, 0);
+#endif
+}
+
+/*
+ * Add a file to the link.
+ */
+static void add_to_link(const char *fn)
+{
+	if (private_ctf_link_add_ctf(output, fn) < 0)
+	{
+		fprintf(stderr, "Cannot add CTF file %s: %s\n", fn,
+			ctf_errmsg(ctf_errno(output)));
+		exit(1);
+	}
+}
+
+/*
+ * Add a CU mapping to the link.
+ *
+ * CU mappings for built-in modules are added by suck_in_modules, below: here,
+ * we only want to add mappings for names ending in '.ko.ctf', i.e. external
+ * modules, which appear only in the filelist (since they are not built-in).
+ * The pathnames are stripped off because modules don't have any, and hyphens
+ * are translated into underscores.
+ */
+static void add_cu_mappings(const char *fn)
+{
+	const char *last_slash;
+	const char *modname = fn;
+	char *dynmodname = NULL;
+	char *dash;
+	size_t n;
+
+	last_slash = strrchr(modname, '/');
+	if (last_slash)
+		last_slash++;
+	else
+		last_slash = modname;
+	modname = last_slash;
+	if (strchr(modname, '-') != NULL)
+	{
+		dynmodname = strdup(last_slash);
+		dash = dynmodname;
+		while (dash != NULL) {
+			dash = strchr(dash, '-');
+			if (dash != NULL)
+				*dash = '_';
+		}
+		modname = dynmodname;
+	}
+
+	n = strlen(modname);
+	if (strcmp(modname + n - strlen(".ko.ctf"), ".ko.ctf") == 0) {
+		char *mod;
+
+		n -= strlen(".ko.ctf");
+		mod = strndup(modname, n);
+		ctf_link_add_cu_mapping(output, fn, mod);
+		free(mod);
+	}
+	free(dynmodname);
+}
+
+/*
+ * Add the passed names as mappings to "vmlinux".
+ */
+static void add_builtins(const char *fn)
+{
+	if (ctf_link_add_cu_mapping(output, fn, "vmlinux") < 0)
+	{
+		fprintf(stderr, "Cannot add CTF CU mapping from %s to \"vmlinux\"\n",
+			ctf_errmsg(ctf_errno(output)));
+		exit(1);
+	}
+}
+
+/*
+ * Do something with a file, line by line.
+ */
+static void suck_in_lines(const char *filename, void (*func)(const char *line))
+{
+	FILE *f;
+	char *line = NULL;
+	size_t line_size = 0;
+
+	f = fopen(filename, "r");
+	if (f == NULL) {
+		fprintf(stderr, "Cannot open %s: %s\n", filename,
+			strerror(errno));
+		exit(1);
+	}
+
+	while (getline(&line, &line_size, f) >= 0) {
+		size_t len = strlen(line);
+
+		if (len == 0)
+			continue;
+
+		if (line[len-1] == '\n')
+			line[len-1] = '\0';
+
+		func(line);
+	}
+	free(line);
+
+	if (ferror(f)) {
+		fprintf(stderr, "Error reading from %s: %s\n", filename,
+			strerror(errno));
+		exit(1);
+	}
+
+	fclose(f);
+}
+
+/*
+ * Pull in modules.builtin.objs and turn it into CU mappings.
+ */
+static void suck_in_modules(const char *module_objnames_name)
+{
+	struct module_objnames_iter *i;
+	char *module_name = NULL;
+	char **paths;
+
+	i = module_objnames_iter_new(module_objnames_name);
+	if (i == NULL) {
+		fprintf(stderr, "Cannot iterate over builtin module file.\n");
+		exit(1);
+	}
+
+	while ((paths = module_objnames_iter_next(i, &module_name)) != NULL) {
+		size_t j;
+
+		for (j = 0; paths[j] != NULL; j++) {
+			if (ctf_link_add_cu_mapping(output, paths[j],
+						    module_name) < 0) {
+				fprintf(stderr, "Cannot add path -> module mapping for "
+					"%s -> %s: %s\n", paths[j], module_name,
+					ctf_errmsg(ctf_errno(output)));
+				exit(1);
+			}
+		}
+		free(paths);
+	}
+	free(module_name);
+	module_objnames_iter_free(i);
+}
+
+/*
+ * Strip the leading .ctf. off all the module names: transform the default name
+ * from _CTF_SECTION into shared_ctf, and chop any trailing .ctf off (since that
+ * derives from the intermediate file used to keep the CTF out of the final
+ * module).
+ */
+static char *transform_module_names(ctf_file_t *fp __attribute__((__unused__)),
+				    const char *name,
+				    void *arg __attribute__((__unused__)))
+{
+	if (strcmp(name, ".ctf") == 0)
+		return strdup("shared_ctf");
+
+	if (strncmp(name, ".ctf", 4) == 0) {
+		size_t n = strlen (name);
+		if (strcmp(name + n - 4, ".ctf") == 0)
+			n -= 4;
+		return strndup(name + 4, n - 4);
+	}
+	return NULL;
+}
+
+int main(int argc, char *argv[])
+{
+	int err;
+	const char *output_file;
+	unsigned char *file_data = NULL;
+	size_t file_size;
+	FILE *fp;
+
+	if (argc != 5) {
+		fprintf(stderr, "Syntax: ctfarchive output-file objects.builtin modules.builtin\n");
+		fprintf(stderr, "                   filelist\n");
+		exit(1);
+	}
+
+	output_file = argv[1];
+
+	/*
+	 * First pull in the input files and add them to the link.
+	 */
+
+	output = ctf_create(&err);
+	if (!output) {
+		fprintf(stderr, "Cannot create output CTF archive: %s\n",
+			ctf_errmsg(err));
+		return 1;
+	}
+
+	suck_in_lines(argv[4], add_to_link);
+
+	/*
+	 * Make sure that, even if all their types are shared, all modules have
+	 * a ctf member that can be used as a child of the shared CTF.
+	 */
+	suck_in_lines(argv[4], add_cu_mappings);
+
+	/*
+	 * Then pull in the builtin objects list and add them as
+	 * mappings to "vmlinux".
+	 */
+
+	suck_in_lines(argv[2], add_builtins);
+
+	/*
+	 * Finally, pull in the object -> module mapping and add it
+	 * as appropriate mappings.
+	 */
+	suck_in_modules(argv[3]);
+
+	/*
+	 * Arrange to fix up the module names.
+	 */
+	ctf_link_set_memb_name_changer(output, transform_module_names, NULL);
+
+	/*
+	 * Do the link.
+	 */
+	if (ctf_link(output, CTF_LINK_SHARE_DUPLICATED |
+                     CTF_LINK_EMPTY_CU_MAPPINGS) < 0)
+		goto ctf_err;
+
+	/*
+	 * Write the output.
+	 */
+
+	file_data = ctf_link_write(output, &file_size, 4096);
+	if (!file_data)
+		goto ctf_err;
+
+	fp = fopen(output_file, "w");
+	if (!fp)
+		goto err;
+
+	while ((err = fwrite(file_data, file_size, 1, fp)) == 0);
+	if (ferror(fp)) {
+		errno = ferror(fp);
+		goto err;
+	}
+	if (fclose(fp) < 0)
+		goto err;
+	free(file_data);
+	ctf_file_close(output);
+
+	return 0;
+err:
+	free(file_data);
+	fprintf(stderr, "Cannot create output CTF archive: %s\n",
+		strerror(errno));
+	return 1;
+ctf_err:
+	fprintf(stderr, "Cannot create output CTF archive: %s\n",
+		ctf_errmsg(ctf_errno(output)));
+	return 1;
+}
diff --git a/scripts/ctf/module_objnames.c b/scripts/ctf/module_objnames.c
new file mode 100644
index 000000000000..4e3d1d6c6389
--- /dev/null
+++ b/scripts/ctf/module_objnames.c
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include "../module_objnames.c"
diff --git a/scripts/ctf/module_objnames.h b/scripts/ctf/module_objnames.h
new file mode 100644
index 000000000000..b22906bff02f
--- /dev/null
+++ b/scripts/ctf/module_objnames.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include "../module_objnames.h"
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..4514e8a8d522 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -726,6 +726,7 @@ static const char *const section_white_list[] =
 	".comment*",
 	".debug*",
 	".zdebug*",		/* Compressed debug sections. */
+        ".ctf",			/* Type info */
 	".GCC.command.line",	/* record-gcc-switches */
 	".mdebug*",        /* alpha, score, mips etc. */
 	".pdr",            /* alpha, score, mips etc. */
diff --git a/scripts/module_objnames.c b/scripts/module_objnames.c
new file mode 100644
index 000000000000..bd7267710c8e
--- /dev/null
+++ b/scripts/module_objnames.c
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * A simple .tmp_module.objnames reader.
+ *
+ * (C) 2014, 2024 Oracle, Inc.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "module_objnames.h"
+
+/*
+ * Read a .tmp_module.objnames.objs file and translate it into a stream of
+ * (module name, object file names).
+ */
+
+/*
+ * Construct a module_objnames iterator.
+ */
+struct module_objnames_iter *
+module_objnames_iter_new(const char *module_objnames_file)
+{
+	struct module_objnames_iter *i;
+
+	i = calloc(1, sizeof(struct module_objnames_iter));
+	if (i == NULL)
+		return NULL;
+
+	i->f = fopen(module_objnames_file, "r");
+
+	if (i->f == NULL) {
+		fprintf(stderr, "Cannot open builtin module file %s: %s\n",
+			module_objnames_file, strerror(errno));
+		return NULL;
+	}
+
+	return i;
+}
+
+/*
+ * Iterate, returning a new null-terminated array of object file names, and a
+ * new dynamically-allocated module name.  (The module name passed in is freed.)
+ *
+ * The array of object file names should be freed by the caller: the strings it
+ * points to are owned by the iterator, and should not be freed.
+ */
+
+char ** __attribute__((__nonnull__))
+module_objnames_iter_next(struct module_objnames_iter *i, char **module_name)
+{
+	size_t npaths = 1;
+	char **module_paths;
+	char *trailing_linefeed;
+	char *object_name;
+	char *p;
+	char *one_object;
+	size_t j = 0;
+
+	/*
+	 * Read in all module entries, building the next arrayful of object
+	 * file names for return.
+	 *
+	 * The first word of an entry is the module name: the second and
+	 * subsequent words are object file names (there must be at least
+	 * one, and may be more than one).
+	 */
+
+	/*
+	 * Reinvocation of exhausted iterator. Return NULL, once.
+	 */
+retry:
+	if (getline(&i->line, &i->line_size, i->f) < 0) {
+		if (ferror(i->f)) {
+			fprintf(stderr, "Error reading from .tmp_module.objnames file:"
+				" %s\n", strerror(errno));
+			exit(1);
+		}
+		rewind(i->f);
+		return NULL;
+	}
+
+	if (i->line[0] == '\0')
+		goto retry;
+
+	trailing_linefeed = strchr(i->line, '\n');
+	if (trailing_linefeed != NULL)
+		*trailing_linefeed = '\0';
+
+	/*
+	 * Slice the line in two at the first space: the elements past it are the
+	 * object file names.
+	 */
+	if (strchr(i->line, ' ') == NULL) {
+		fprintf(stderr, "Invalid line in .tmp_module.objnames: %s\n",
+			i->line);
+		exit(1);
+	}
+
+	p = strchr(i->line, ' ');
+	*p = '\0';
+	p++;
+	object_name = p;
+	free(*module_name);
+	*module_name = strdup(i->line);
+
+	/*
+	 * The array size may be an overestimate if any object file names
+	 * start or end with spaces (very unlikely) but cannot be an
+	 * underestimate.  (Check for it anyway.)
+	 */
+
+	for (npaths = 0, one_object = object_name;
+	     one_object != NULL;
+	     npaths++, one_object = strchr(one_object + 1, ' '));
+
+	module_paths = malloc((npaths + 1) * sizeof(char *));
+	if (!module_paths) {
+		fprintf(stderr, "%s: out of memory on module %s\n", __func__,
+			*module_name);
+		exit(1);
+	}
+
+
+	while ((one_object = strsep(&object_name, " ")) != NULL) {
+		if (j >= npaths) {
+			fprintf(stderr, "%s: num_objs overflow on module "
+				"%s: this is a bug.\n", __func__,
+				*module_name);
+			exit(1);
+		}
+
+		module_paths[j++] = one_object;
+	}
+
+	module_paths[npaths] = NULL;
+
+	return module_paths;
+}
+
+/*
+ * Free an iterator. Can be called while iteration is underway, so even
+ * state that is freed at the end of iteration must be freed here too.
+ */
+void
+module_objnames_iter_free(struct module_objnames_iter *i)
+{
+	if (i == NULL)
+		return;
+	fclose(i->f);
+	free(i->line);
+	free(i);
+}
diff --git a/scripts/module_objnames.h b/scripts/module_objnames.h
new file mode 100644
index 000000000000..94fa48498313
--- /dev/null
+++ b/scripts/module_objnames.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * A simple .tmp_module.objnames reader.
+ *
+ * (C) 2014, 2024 Oracle, Inc.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef _LINUX_MODULE_OBJNAMES_H
+#define _LINUX_MODULE_OBJNAMES_H
+
+#include <stdio.h>
+#include <stddef.h>
+
+/*
+ * modules.builtin.objs iteration state.
+ */
+struct module_objnames_iter {
+	FILE *f;
+	char *line;
+	size_t line_size;
+};
+
+/*
+ * Construct a module_objnames.objs iterator.
+ */
+struct module_objnames_iter *
+module_objnames_iter_new(const char *module_objnames_file);
+
+/*
+ * Iterate, returning a new null-terminated array of object file names, and a
+ * new dynamically-allocated module name.  (The module name passed in is freed.)
+ *
+ * The array of object file names should be freed by the caller: the strings it
+ * points to are owned by the iterator, and should not be freed.
+ */
+
+char ** __attribute__((__nonnull__))
+module_objnames_iter_next(struct module_objnames_iter *i, char **module_name);
+
+void
+module_objnames_iter_free(struct module_objnames_iter *i);
+
+#endif
diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index ac3e5ac01d8a..fc0e9e51529c 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -53,12 +53,18 @@ patch -p1 < %{SOURCE2}
 
 %build
 %{make} %{makeflags} KERNELRELEASE=%{KERNELRELEASE} KBUILD_BUILD_VERSION=%{release}
+%if %{with_ctf}
+%{make} %{makeflags} KERNELRELEASE=%{KERNELRELEASE} KBUILD_BUILD_VERSION=%{release} ctf
+%endif
 
 %install
 mkdir -p %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinuz
 # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
 %{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
+%if %{with_ctf}
+%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} ctf_install
+%endif
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 4dc1466dfc81..ddbdefbc538b 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -23,6 +23,11 @@ else
 echo '%define with_devel 0'
 fi
 
+if grep -q CONFIG_CTF=y include/config/auto.conf; then
+echo '%define with_ctf %{?_without_ctf: 0} %{?!_without_ctf: 1}'
+else
+echo '%define with_ctf 0'
+fi
 cat<<EOF
 %define ARCH ${ARCH}
 %define KERNELRELEASE ${KERNELRELEASE}
diff --git a/scripts/remove-ctf-lds.awk b/scripts/remove-ctf-lds.awk
new file mode 100644
index 000000000000..5d94d6ee9922
--- /dev/null
+++ b/scripts/remove-ctf-lds.awk
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# See Makefile.vmlinux_o
+
+BEGIN {
+    discards = 0; p = 0
+}
+
+/^====/ { p = 1; next; }
+p && /\.ctf/ { next; }
+p && !discards && /DISCARD/ { sub(/\} *$/, " *(.ctf) }"); discards = 1 }
+p && /^\}/ && !discards { print "  /DISCARD/ : { *(.ctf) }"; }
+p { print $0; }
-- 
2.46.0.278.g36e3a12567

