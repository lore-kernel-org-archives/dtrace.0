Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0B4C83
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750824908; cv=fail; b=hZ8YYnJ+y2hLMXyjgizrKVkgcFsDoHM/R9RsPeZg76GxEV3ZDfMLmrrdz3Mi1LueFx+kGcRG9waZ8kiUM5v1DOO53Efy78kr5QGJe19NkZLFBkqd58fr++MWu8BHZGJwAJJ/XeBAjw51SkG0gGTkjew28RlyfWm2xVW3+Su/Ey4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750824908; c=relaxed/simple;
	bh=gIOUVMuaildLxkjlOE1XX2FeuIcOznf07ORWKJkDsn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oL48sfO8kN2oBOizjeSYDXN6x4cciIZXDmPOUkWQJUAQDiXd/q2fkbTaeds0FeyemcpHvEx6U95UTb9hAOSCQr4w34BHuV0UL5eq2J/akwMP/LxhQXZa0uCzE6uNipqx+2iKHdACU+xaRm+xF2dv3RuthBJ7KxsJEZhdKt0qDfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NeSPlNbS; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WMJsa9dR reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NeSPlNbS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WMJsa9dR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMj9Ev013808
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LQDeiYJw941v7KoNJuRRL8EpaVcLpntoVsfDvtgfCYg=; b=
	NeSPlNbSaSGa2HV13tFb4ImG70lyxoQmsGmertiroJwE08lRaZjfJ3uAuLxtuxJY
	zmVD/+kZimIsGyYOv4gxZRAzsKLMr7kGWd7pAfufvczO58LP+wZNlCNcSJR1lMAw
	mB4ZWxcGZB9RsYb3j6bmhR7kE+5NrJ/ZJzBPdDKsM/xJrPWejZ1b6tX8m04fgNSm
	baGO9F4A2qazO/xsbIKdlXLGnPVoHrcotEGfnK/Oq5+S/ddGwt90Yss4u2EcqWQP
	aDbJ4BU3H4alQp7xOvhXfTNYKTAaDgQEQaq88XsqHxtgt5PnLy3aX3Npn1VbrVwf
	THomDoryCybqqz1WjSDJfA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumnfp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:15:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2NPjw039142
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:15:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5gvaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXTomDuD6n9HuYv2QFeWl4rgt5dl9RT9Tz/ujsKujtvaQX1Re4kqatzIoqfJuQRdZCRCmffQ/H+UPJlrKIeG9GDN4y+qnuTGscORQuI0nxKhRYySoajSQWihe0D1iZLnU4rgXSNKoDVEPROhhBucDcZH+y99+G2Ev8TeqhhtfFoSpB/032qGIDJYjeF0yWnhrCDg0gAd96+RXU3GeXp/SNWO83FLs8FOmpMUi7kX7QOg1AQSo1B3+JVpdHUFuWWqY52BMA88rVfJCIUNeOVN7SsFPP6wiKDkJSYO9rnM2rDf53Csep6W2w9OUyaCWt+zdvMxTT1Jq2cX9b12tzbUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziH63zCXB9sHxvQWzAOzzl414eAyPiuQZBIYgW/fRYU=;
 b=OMXGVCETmuVaRv8j4AZYuP+3MWasgiKxt7HSudTvZcW5V1E+k4Zc7ntt2vYZrEnWZA1HIMjCTWF8pkFHX3jbN5KkP8cg1G3TzgT4WGLcN+BwoPNG210OvTAFZ5+VX6CfRPE7doVUOld3fX2xapBXoW6NkNiHxSY1thpmWe3cM/8hCuTFhdswq/66svPaSVBGxGeL0ZJL8/pk5aHV88YbCKVcWRcIMzm6bwE+E3kSFt86qDqJ/uy+qSQrU6re9C+4II9Y8PwJ1VCNo+LxnKW48qer1BRY6RfkxkkE7titp6D4V+WOFvUg4jlShHhfQ13DBR3OLNby/UlH57YdIgW8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziH63zCXB9sHxvQWzAOzzl414eAyPiuQZBIYgW/fRYU=;
 b=WMJsa9dR18QiHj4Eo8yqQ/coVa3chJsugIeuDj217jkypkl1+hplYRtlROpSVMvDrbqU8aNFa13C7dU3tz+7FvDZmoxORaGRpyEpRqY3UHsw3dtf2Z72yocoeJ/msrTdh+zrJ1FgL2vXQ8BzUGbJPQveNI7oHBNu8DZFOIVXNwE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 04:15:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:15:00 +0000
Date: Wed, 25 Jun 2025 00:14:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 04/14] Test: caller and stackdepth tests
 for fbt provider
Message-ID: <aFt3wbbYDMXSh0Ev@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-4-eugene.loh@oracle.com>
 <87cyb7d7rc.fsf@esperi.org.uk>
 <28ab1e2c-d376-dcb4-bff8-4db5f1d12802@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28ab1e2c-d376-dcb4-bff8-4db5f1d12802@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da8ec49-4b71-4030-5e94-08ddb39eda25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Vy9tG0zlKPew7rFNCz7aUWe5oqIfkX1JlNIfDj+guc0m4xrQ+q9P7YAiRd?=
 =?iso-8859-1?Q?PXC+ywqzHQE98fIc+dgI25c6RE0TKrxBbnuRWwUTgI+l4tDPNdJLQefA5g?=
 =?iso-8859-1?Q?FUDiSSk1APHa8HKzOrC7CsDZ/1GDP6VqR2w0kWTeAFngInmbvLUGiTQqfC?=
 =?iso-8859-1?Q?ACeGaqBQb+B7K+f3AtOn16XFtkXmunreJrdYy+9nnqcxJz7dQtaeeYEKbS?=
 =?iso-8859-1?Q?WDDtq7NB32ulC5OD7qKibF+lxgBPk1wN73BoMwEzKnqxA9Q/CYhaHDk5O6?=
 =?iso-8859-1?Q?oAi+/oH1QXVqRm14p3QX0ob7vQfrDjBUw3e+0i013RwPvHnvfuUFox4QAM?=
 =?iso-8859-1?Q?OVZBNlWe31LSaoWXAlpBzR2PTreFcBi4DkfUM8iBAbPkzrZVcDxOvrOR31?=
 =?iso-8859-1?Q?2jvRPi74Mn/Yt800Io/Rz7n2Ob7g9l8ma0f1yUKVIWhrbLf97xJDsr2B/U?=
 =?iso-8859-1?Q?EeaSdt/MgPWhUh3XpaisAny3taE2eJ8yibT/UH7c/tm0Ndvg64no4z7ncv?=
 =?iso-8859-1?Q?MwWp81vnDpw1mTJLpMa+8jk6bgZrAbt2othgF69XBwHz0OjL48UfQ3lDZP?=
 =?iso-8859-1?Q?BXKc6mocTMsewvkh5geYvm5Y2oxYbuabrlnxrdqtMtJxw8WYBuGSk5PXX4?=
 =?iso-8859-1?Q?Xs65Bb4d63jP4VY4lNC851j1X+7zUVqjhmxaDGu9BssFrJRQ/oeJZzk8s0?=
 =?iso-8859-1?Q?PJfFwY/h0sY288Kf5r7hEff9NNqUsyAw1n8RWz5uQjrIdwVoiMiBYyy+yF?=
 =?iso-8859-1?Q?OMyPWQR86tsii+aMIX/ndRLirAS9QAASe01Jsiy0oe4t27mbJlbMh3hNDG?=
 =?iso-8859-1?Q?hySkUKId4q8/F3qvo+oDd56v9ogz5hhTWGCQKFcew8bVz8z+29TGCzkmOr?=
 =?iso-8859-1?Q?pfdzKtwL2kH+lWYhipR9j12A80XdPrNY8E0m8bPsZtG4NwgIyY7gH9Z2fY?=
 =?iso-8859-1?Q?usm04buuhx/kf+ME9THPzdXqUB/r0Q4bE85mXW5ZldHAzUa9LGfOrKht6X?=
 =?iso-8859-1?Q?m3BM9oCHML4xH38/Hrcl5wHgVjRBVeGaN3M+nl8bittRlntXnCa+MGYJiy?=
 =?iso-8859-1?Q?WwRLgbYZV77ocsBSH75K5fN+4Jr/fBk+Vm9e/0NPmFPd84KQfyceQKC51h?=
 =?iso-8859-1?Q?T5BRGDm5F+t3JRS8rYnok0AR0SObSplW7JEUWzexFY7rVj6Vm3l7TQ9x39?=
 =?iso-8859-1?Q?BVkz+Bdzi4YDNhp/PSOyO4VWCGhdoJlcKfCLysTLo8upp6JtprYLYA+qHV?=
 =?iso-8859-1?Q?XRBMsa9CIu9Tl/X8BXCygHQCZzvru/or6+LUbmcELap7vHuErzBOhdCpee?=
 =?iso-8859-1?Q?wQ4AOvbmTuiHnzvwl35PZpIsDZmtJkuVB5pctNvu8BV7hN5pLcKtMs70FV?=
 =?iso-8859-1?Q?dvV7KrR1ADTMIH/xtP/5ee1g486WyMaQHZYUY9h9snq+dqXzTZqIbvQSt9?=
 =?iso-8859-1?Q?MsRWXaeGzxgVKrxXipmqFMMg6INSBrxZrgmeUiL+9SFHe0prv5sGRbx6V9?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zrMVNzVA/AnEIeiP5ASve2JPNwweWL0xCLOaKMx82Z8fxSdKEOiFu4zLwU?=
 =?iso-8859-1?Q?HaClQhaBhCmH6vhUxPeczrFJURQhEwfRoWg/CHKHjt58AWVa4OAAVSIIck?=
 =?iso-8859-1?Q?H22agiSTzCxeGVx9RhGRkK5oDvUnCnTsAFn9Kb+ZbkGyCKdFp6XDeRsOcX?=
 =?iso-8859-1?Q?ZYfeoTyoNDbB3HEeUSqnZHSdz6J8KKHsyWghxnAWmFeZfX3jwUnuOjj8S+?=
 =?iso-8859-1?Q?/kJ0qKoOdJph2eczCQqhYJBZ7g88k7PRL7I2nnBTOvVTgzRDYGUvp8gf1q?=
 =?iso-8859-1?Q?9p0PpG9VXNl2+hiadR+sTEzw9bQc0oFP8pmqEEf787ucX5LqCVpuSnVl8A?=
 =?iso-8859-1?Q?A3+H3IIS6InGMwik3jqd1cweWO3+AvtLh4SrJ0Nnf6oRms+nNakKFni6IE?=
 =?iso-8859-1?Q?VcTa65aBw8SM5apDjJHGZVFjCDrH7AW22m9UbNRVHQywpRBH3CI2QDQQlX?=
 =?iso-8859-1?Q?xeMSJGTZRLwaEjb64212IARiJOTSBUf/vM4d+eqwIBI5oPnTT4cHe7BXQy?=
 =?iso-8859-1?Q?qqRDhtm1zU42+WBVASFJCxZBqlpYaYGQ1kr4lcx0C7HT/obJK7kOF3silW?=
 =?iso-8859-1?Q?m5l64oN/DA/UWcx2FKOOfa/o5N/164eTpk0K6nc5IxdXeZHV6CHWQeXF46?=
 =?iso-8859-1?Q?zDFq7AhlnyaTv82uHY2mziB+k5mAn7npOqzqTJPtV8jwaSgyIhaGzFbwdT?=
 =?iso-8859-1?Q?dXOZ4NdqHP30HWlcuj+QjM/WOn9Me9wVqZusT9xsTHeqGlaAIYarjzuFt+?=
 =?iso-8859-1?Q?ZXuWukoien+0dnChI73UbkdaCb0YxYSpydY5litgUbmzgH94sPjVhMZDwq?=
 =?iso-8859-1?Q?G2jc+9ySIzvbJFyHXkHCZwVCypcRcvjaylwGSKHdh/LeT6INwDMWIUFV2Z?=
 =?iso-8859-1?Q?CskitHEmURPGrbaRYkJdO/oAYXB7LR/R6a2ZvHMTZKZvgNpjUo3jrBcW7w?=
 =?iso-8859-1?Q?7AO3qHRBhuS2vNPxEkHTBdg3XIohp6awvlarAtyZ2rdWShUPzUOwgvAq/x?=
 =?iso-8859-1?Q?o64lBsm9NLddjcTBrwEZs3V6La2diRTPIhKxltRzMr60yN9bIs+9Kl+emr?=
 =?iso-8859-1?Q?RW4qOGm7B8bJZHIABXdqdgJVFY/2QGL907WZVLLiuWl+GLbPEYvXUgjcpI?=
 =?iso-8859-1?Q?/psTJbxA2ySPhGSUa3BEqD5jZ3ii/fLCZnKZIha/IeZ6ZJEN1juEsKO33r?=
 =?iso-8859-1?Q?sKlxhTaMHT50i0u7rqHCSZex0h+ij+SzyYLQVYkNVUaW7yhmj8xHp6Qxhu?=
 =?iso-8859-1?Q?zNL76SjqM9hPdwkXab/kG+QQCqGBvu5+7NwbxPKJ6EpcSWMd+8FXAbPLPX?=
 =?iso-8859-1?Q?qAm/XMow4BMXqjqMGrcEz/G0oIGfp4lqjhE4U0X8LDXHKk/gf4oNV9UZLd?=
 =?iso-8859-1?Q?d36rXXqZDEjHRz7roj47fFGfbZ+9P1yURdpuE/W9xjvSouP484+sAWdbUe?=
 =?iso-8859-1?Q?rTqW2ZzDcleEqvH1i8KYsWi0/gjd7VZH2mZ15RSBahnql+39DKDoORom5o?=
 =?iso-8859-1?Q?e8kZgt3VM9bsflAswBU+Vp5J6dXT+9Pq6MWT9cnizYY93k2Fuu3n8d58Go?=
 =?iso-8859-1?Q?oB2GUpbVmI7cGHWpGCB8Y1OvBuJtYtjsgdRH8g0sb8XczL9Kqtiks2GXHB?=
 =?iso-8859-1?Q?AIQVNZmbAHAH0HHU6iCnkCpoaNsZLzPcziF6m2W4RSkkRWPlUnRrrmYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K78rS6VtMm6A8DQaNLZVuKtXnddQ4TZgD7UwYhiTKjE4MCd9tqWGRBpX9uzx71PbogLzD1Zf1uNjgir8n333IyNFo+ImzbPU/XauHfrwckO0iWCISZ/iW8WECPJa6Sa7+f4NMHwaVCwo60dOngLXlpXYU1VJMtKuJCcEd+fovQeZNgEigk2uvHxGcH4JMA6oCI900mZEsV5zSR95hCb1Ptx+67Eu8/ze/gxUseSuHa6QUOTv0C59B+q5GIrNMkOq5+sU4uFNocEt++UGDkHbEdcat+5SvUt0liI8hnT1aMaRcAznSaJ3UTxizLwxPsgXFfsspzNyLpFGhXt3X1mLRuFZAQWWBxcg3IB9ueLxNyaCMaBElpgk3YdQ8o6peykVUjemvsvgmJ1ekDzHFHY3+7JtnJv0yOJ4YVVJDiv6yW1XLfw9aWOteBDp5szGFEud0h1yoopdV4IJtTow7qIrtANGGkviCUdAgbxrgK5xNzy/H0QfhXf86S0gjISbizUta084JXP8FDb0aN5D+eCQhH7rsXeiCg47n4oMadAHTydFZ7fVGuOlujJNKDAG8ZcOAo44BGjp8X6KKgCrO+J+yEGi88EltsIo9J/BHL6aPfU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da8ec49-4b71-4030-5e94-08ddb39eda25
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:15:00.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auYIGou/rS85H1UfqvVLwleupvnxM9+9h03b1FZJxrYmDsMC1LZ1R0Tzx8TfVWAmiz39RnzYKQ1z4uuCYnnu1Qbm0/KY0L7zPaCLSYbz+1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250029
X-Proofpoint-ORIG-GUID: RgnHV51j7i79CfrLWTI8rVua60HuucOJ
X-Proofpoint-GUID: RgnHV51j7i79CfrLWTI8rVua60HuucOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAyOSBTYWx0ZWRfXypvFuoFsoR6n hJ7MiaHbZ1zl9R/g5Jm+UskypjVdYwd98UV+jVNytf+6zsbsi7zojLz6z34QALHe5t7yhO/LOWE ypCiRYHxI9/yo5cOiVN/DPf2nynYg+5xGxOHgqe/WI2e4WlQWfN8RfgUUW7gKT/FWj0MJjPlSJD
 GB3hDV8mlJLww8X8x9+7dMAM8xqfNjHk+cb4SSWipKpRDTTPAfd6837X3VD+dAi9wWiyckwdwN8 SJ3XXd70SUzmRNJZFCtlYV6SCWGNT7YvLCQnl150yrau9jcBqCHiJRFoVC+ubltjlnCHjvu4lTp XAzS45N8nUHWjiLArOZ6TMXpSs3pPc6bHPl4V//Dg8sclzxEYgUj71kEwjjBGp9wTcjdICYYvBc
 mPhRi2O8CaKHeraPijWA+ATT5TTNyfIiy29rKTOegpd/cdDH7Q58CRvS+ezLWU9kIt7inr6Q
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685b77c8 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=VD_tIPhDAe3WdsJpS64A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13206

On Mon, Jun 16, 2025 at 03:43:50PM -0400, Eugene Loh wrote:
> On 6/13/25 10:40, Nick Alcock wrote:
> 
> > On 22 May 2025, eugene loh uttered the following:
> > 
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > We will introduce a set of tests for the caller and stackdepth
> > > built-in variables for a wide selection of providers.
> > > 
> > > For the caller test, we will essentially call
> > >          stack(2);
> > >          sym(caller);
> > > and then compare the caller to the second stack frame using
> > > the new script check_caller_to_stack2.awk.
> > > 
> > > For the stackdepth test, we will essentially call
> > >          printf("%d\n", stackdepth);
> > >          stack();
> > > and then compare the stackdepth to the reported frames using
> > > the new script check_stackdepth_to_stack.awk.
> > > 
> > > In this patch, introduce tests for the fbt provider, along with
> > > the support scripts they need.  Subsequent patches will handle
> > > other providers.
> > > 
> > > The old tst.caller2.d and tst.stackdepth2.d, which tested fbt,
> > > become obsolete.  Remove them.
> > Nice! My only caveat (easily fixed) is that the old tests had header
> > comments saying what they were testing, while the new ones don't.
> > (Yes, the awk scripts do make it clearer, but still...)
> 
> Got it.  I'll add a brief comment.

Can you please post the updated v2 patch ASAP so I can merge the series?

> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > 
