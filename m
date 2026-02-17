Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB4D21D5B0
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347726; cv=fail; b=XODO4cmXmxGN47gEaoqlcqxk5zKA7t+d6yiIR2k9Cc+uRaL7jxRZ0iMGJL5JvEpxMIfvctIhJqowjL12tjI4CE6k5IX0A31WdG4h3PWxKNXkqlw35TBiG+7Hk0ST1Jp2owVPISK9D9+LVaLOgv1XH/DIzYxNEuvbxbs3ona81Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347726; c=relaxed/simple;
	bh=0NNaw8aBHrYLXxv+EpExhn+fF5gGqzj0VEyOazimC5o=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RLCQLFJy9dMSkoeS5oDAEMPgLOrtfryKhyV3x/0ei9IDzccClX9ZyvPUgce9+Dj9K3OGywAKU7j3IrZELe0ZPKT9kLQjNW5UJKqj1ptMc5R3zSxddgaQ5zYsWitfxJNwSwFK/AjigU2GAt/ePfOXEhz/Rs29IymU27JogwTKPzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eaSt7BCl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=feRAgq+8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eaSt7BCl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="feRAgq+8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNJun3789026
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 17:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=HyQUThwRSiGy28VIVRbFeJBWas2LVPCWSYDlMgqnCkE=; b=
	eaSt7BCl7J4QqjhnbA+0LcKzAGtlVTWRGaeyhw28709huwpAJYDE1RxwOazLOvz4
	Ix00/vdEVnTLFp0SWqfohbojzTEyr8yhqa69Vsh+fqA8Ovs70fDffDdR7zxZdt8R
	KAcjKh1an8erLKTvXFwYhJ2dIlD/ax13+gteu1uNM36T5nHuiGIHF6y7iJQB8ULB
	pnfjt9WNGwQRoxBWXAFdYTBjvLUyggLKdAUcFtF4YKho9960uaxamlHKDbUuJYRX
	89fU6EP5JNdVARqkytqMrZReiNzPrNsKoj8izKjhB5k6wmRPZ0ipysASG0Jxu/Un
	OlEhvNN4ObTAx4f7IcR4xg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r417e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 17:01:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HGDqlV005568
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 17:01:58 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb22r6wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 17:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvHG9uvXElQgmV/tNI8cCSyeijj74FoNZejW87ri7BBYhV2V64rDU72Ua5YSZ948WgPuYHf/mmL+IP45j2mOFtgcFuwBvNU6w4nymW0R6liicXbXU8zvKQpIKjYF0ui5qLodc/pH3OMWJftCKuHDKphOtVHRLjYENtTXs7HGJy4WgAjKV9IZyAma9UTD72D9JVtX5GnlmbClHA3MdE9Ocm2JsJEwalBmlndlQz7t0uGAwqNnQieYXftgFUyRch5M202fPFTjwv+LMrca6Fo+amjIkTXSATpGcpyDeX6PIAHKNd83XSAH2EALCglKMv1A21ZLmFv4NYwtjn3ohq5r7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyQUThwRSiGy28VIVRbFeJBWas2LVPCWSYDlMgqnCkE=;
 b=V1WAiX3ZzUM+8JKa7BXS29Hy53luNuDjsRXzaEoTdOLuYHgRLLzc5SHWCS2+JCNJ/jA3JqmNxXcHl58y+JbvsN1crIn9ha4oz2PKfyMoSyvKNL9S1tLwbkCDOSbwMn8UrdGUxN8CZd/olHy/m2joA8lxwfMECU9EWuAGlTAcFgG8tWG3ctHc7PGt14BATsCKSvehYaMONR9urVlo5x+7Vv+x61prD0uy+74EYVL0oLZYJcJweGQ+eDW0jIqTwXG7pnXDyDClJINs5LOdqEzXuipwaeM+t+28Vp7dbR9eXDCAkl4gshrDG6KW4ergyi272IK6kuXXU2It9bzMVviSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyQUThwRSiGy28VIVRbFeJBWas2LVPCWSYDlMgqnCkE=;
 b=feRAgq+89howr/cTErwovsFJa1qPgc1h4S5qhAZuWCrg0DO1at0kXeyEzY/DsJfvJ5ebkUIjQ+R+YHIgfgJXOo1jat0nBPvQK7uBMeHLLDG1/4mgbpGDAnhhC/woqM3ZnHCf/ecLzsLT0icVo6X1xUKbD26dQ2qLdT8XE/dthkk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA1PR10MB6760.namprd10.prod.outlook.com (2603:10b6:208:42c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:01:52 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 17:01:52 +0000
Date: Tue, 17 Feb 2026 12:01:50 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] configure: add support for --disable-option-checking
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75222227FA6AB2FF619DFF29C26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA1PR10MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d2103e-65d5-4141-18ff-08de6e463f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BdmLnHcx2rlxZDCVi9r5XcrtQgDySO3GQJoalQ4JxDLTi5HsO6BRSM/oeaxA?=
 =?us-ascii?Q?NX3Y7QWneAs6MR3IaVFu0w9oPPXBfwapmt8ZmkkZ4EhtaO66YzGaPeoiRcY9?=
 =?us-ascii?Q?vxgpH5f/oqDfuFQXraQAvhqCX5xP1/JrV8VX6k/rFbCJcgyYJEu1xbV4nmF7?=
 =?us-ascii?Q?lRLlBSRRdomeNYpnqK57y/vb6GP8M03AdjJEdbjwMfF8Xp3rIiY/Jl2AdIUK?=
 =?us-ascii?Q?crwLdZGrkt5HnV3E/LsEIbZDBFmGFsh+xyKf1db5t/yryhaFwO39ND6oImlo?=
 =?us-ascii?Q?8jvU9xpZzyV0sjSqoxCkuRdjnIBoi5P7P/I6VZ8q9UjJi52RGQYxmGwhfIuz?=
 =?us-ascii?Q?VUCb+mJNCbesPTNG+0VuUARqnjHYAcPHt7hOacutNNjIdxeFptZyAjQ9kzLN?=
 =?us-ascii?Q?aU5tPoSSH1yFUqElDnk2kWVL1Sk5wD8nHY0CjYbzGvh95GEFFO6IDeoajsos?=
 =?us-ascii?Q?Hu8GAVZeDu512RcXI3N2riRrjVx1j1Gd/ZvS8+Of46HdQ1ioJ4sv5QBX3iPH?=
 =?us-ascii?Q?KNRdfDCVlWyN9lIM+TBFEAM30tmRtEteVsqvJsE/F1mlRYdh3ncVPMTXC+RY?=
 =?us-ascii?Q?bDMZfQi7ekSzq9ZP+AAhlJv27n2ABJNWHgw9E/I+W4AmykhIeZCSRU857drV?=
 =?us-ascii?Q?Bq5oQ+4R4KMN1r4gy5bZsWbbvFbe7gAJrIXySE0fKrmfQeOdtL6PTTDX1C+H?=
 =?us-ascii?Q?Ep4KbQQt9sYZKFeXKRt9RltGhnGAaEmGmuvjNuaXYr1QK8H3jJ3lxeSI7LVX?=
 =?us-ascii?Q?aaXEBG9pu7xaOwYdS3snVd/Vvkkrgo1jLjqvOEktp+NnsP//Aw2Daj2K+tRt?=
 =?us-ascii?Q?U/n0Kgcd9sSi+ifEsWYpjuzT/Irwno5J8NlZ3PAuf7FYoMSoAc1uIEw95qQf?=
 =?us-ascii?Q?5nbtfPrFvcye+JXgX59n84bv3kso94sFhu43bn1WsjMKVXaMxBKjMrT4DnH/?=
 =?us-ascii?Q?w0KwRMbxfNX6cZo60LRstrUJe/XJoaWcqICfNpAOymR8LuSeq/yyld+o7PLo?=
 =?us-ascii?Q?BRs24Vsl2reDqSLhwC/JY/jlw4DVm9UwReKojgut4vy7ucMIaGoq/Q2J6ajm?=
 =?us-ascii?Q?4mOVv0etAg33F6TLguhqjr5ZyzERiJJvZz0O/X7zEr3ROnKSKSoMUb5dGF8k?=
 =?us-ascii?Q?+EKB0Cf0C7Tq2aLPROMTKhN0xnmdT525vSKZVyTdeXFTeE0YD/AxorddIAaB?=
 =?us-ascii?Q?9+nwJsryEXEbm5M2OTLPePIszVpU8pUF/Q365GJ4gc1Z1mN4q+C6gzpwwWLq?=
 =?us-ascii?Q?N1dII3ya/ERjTMo8VWGpOTyzI2q1OvubNy6lRUYvhYlJWd7ojFi9D1+YVf73?=
 =?us-ascii?Q?8Ymh6T1dcLJCh4/vMqDsS3hTsyV8ICM980GtpiLngAXe8avJlAhDgId9McqY?=
 =?us-ascii?Q?FD1/8JsxgyvBNj1Pj9YjVmjvTWlPok3WeQSZugY/tlS01Dvri39cqGUjfJlC?=
 =?us-ascii?Q?g/DxtkbUzfuPpV7rUSh+KLqzS5bJVuyyOwQEdFqGnCaLt3XxTHMtrVr5QHHM?=
 =?us-ascii?Q?XpEdbNMkxp7rCm1TNb6bNGdJLmZW1sUb9guC173V9URBNsVyFfYm5KjH1O+U?=
 =?us-ascii?Q?HnNq7+7/bd1oFWGRWf8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?flQNMLMTGIK6bv6Z4BXL9VIQwwiXYItnR1kpkx7OjD91GaTdlgVlXoFaFLp2?=
 =?us-ascii?Q?JDCpmixah+6X8bQLqM+QaBE8RxlgunpNJIwrvGazpANJE9FSsiwhrGei2rEE?=
 =?us-ascii?Q?BQtrE/326USDuMYX4WIELzYoXqsf9kdG2cNQ2gKvN6aQK7hrBGtAC4+OhJfC?=
 =?us-ascii?Q?Yb3UC0Arv3bKXPwuPGnzwTmbdbQdz9/KgmEZPpUOGkAShbt2UJWUahfSPQtt?=
 =?us-ascii?Q?zNGVtI7LGgEXnK43NMKV8ltea/EEA47Ip9zpLKfsAKyIlPySCrm/R6flThAb?=
 =?us-ascii?Q?L4MiFnNxcd9eLO6hLZXi0f5bqrr+RWhmrg1nGcjBIhgNutpWbj8Rjzr5DTp+?=
 =?us-ascii?Q?JXOmGseqi6nm9kZzuRoDjDYAnN7cpqI6QdmlgQxWbb76hd6hEc0kEA00+F1/?=
 =?us-ascii?Q?v6OtOjQlVjNzmwrPC7b/u9etPtVjCtQ9pRZquAvc/j5y/+aZ7YBUV5KSWrun?=
 =?us-ascii?Q?yGzoWkXLBBNOFWxrJAqP1ROV/OPlh8HO5/45h+HVn8Zhx14QhllPbE9EvTpH?=
 =?us-ascii?Q?bWQiVTInbgU4+hLZDroUCFDycCGwYABG/ineg28+oyBSpKLxWjENGCyufBSD?=
 =?us-ascii?Q?r03uUWloXRyzsOGjsSsqsDUS1PmKYgnCzyvmRTFtdJRCaomyCGsMZVMF79zN?=
 =?us-ascii?Q?kRra3aFVLOdSzsoeUnOZFEW9suxSrWiOROvRFmpiafuZwyjRrBqVHjeAm73s?=
 =?us-ascii?Q?wGFedNn8J39/+q4mhyJaq8z+qVtvHKddXXPJtlAmc+Pe0Wn5EMznb3mxM1tP?=
 =?us-ascii?Q?s2sWKbIZ8nBvTzpKLoO51G7qNH0Muf7I2m65l2C1q2tYz5jy0Iv7DUvjlSJo?=
 =?us-ascii?Q?3IRLaNve6txXZuYNoxzadJQ9iE4wwC8rqGRr1PHkmCc0Ed94ioAnwF/p1hua?=
 =?us-ascii?Q?tfWfsmbI+owdq+Y81S0lZ+syRu9fQce5XFn9lzUBxJ92I0tcHzpXsQRAuiy1?=
 =?us-ascii?Q?o6U7VJo/O5bPvZWbYOGiPPdP/R2A4OWW1wshT3tHb5FymeuA1/WRcs4xiKxf?=
 =?us-ascii?Q?zHau0MuvRbVL5aPmPUJgtVsdMRO0whfYEVZVbVD4EJS2xQxZLvns4b+V4NDf?=
 =?us-ascii?Q?FTPGZzPrJb10zyxzkuDkSPJQneZUWxJ5zVsXYd1bPbe5r/TcmkQKOxewzaqE?=
 =?us-ascii?Q?OlMBvAcumQ6aIWHM1YAGU4BABiefHIZNJGWCAVfyruX6a9gNMU8ChYtaK962?=
 =?us-ascii?Q?QV8QB6Za0sjrO+e1h2GoEL0AU/TTEjaTn1VSQEirpvTppCbFY2MUERjiwelo?=
 =?us-ascii?Q?Wn9IBYZ7dXQVXo9DdAkkdaQI4i0HTKZGMEWoMFld0FlhG0FHiIPRg4z7coOT?=
 =?us-ascii?Q?Tn3M/T08xnkBZ3KBLuL2OYk3bJB2MrOrN3gK9AUGzn2LFU19++bnlJvaFY1H?=
 =?us-ascii?Q?leU5ycQ4hCCwcaD2u3Si32iyUlPEVAIjCG904zJgW+WluMyK7AArx0CUkeWJ?=
 =?us-ascii?Q?aAWM0DXGtV5fI0eJMeVB98sj4LoH1x0QGgmZskA66Hr3/1ydo9UK7so8ntHC?=
 =?us-ascii?Q?c2eBljLv1Rhu0y34j6ZAA7UJCfPI74AR3FGc0Dfs7gLPqRrd36TujUuUcsPk?=
 =?us-ascii?Q?OYPWdbtIA8FXhW1HfYcrJf2lCz0fpMgUyOnpYTikx5nhg6M4IXxg70uGcJRq?=
 =?us-ascii?Q?boDNymiIJMC0SMh8NK1rOLQWJXx+N1dXVg/HyLobpkQUP5foK8AkDZkiOu7u?=
 =?us-ascii?Q?dNNti5yziFPxmR3ozctrTecQsA8cYc1Xd3CDPSKUPdP60kKFlF7U34RjqjO3?=
 =?us-ascii?Q?J9nJEbkCsQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SvaPZ4hZ/1A37tyUuYnUtIwBNmew2p1l4Bp+cRg78szMt0SNPbKX/8pg7bUn3aPv/K9JftCCQUg12Qba0F+VhQTQC+tSBcqaj3oVIj62w0MGt+VoIowLe3vax9okMX4dxIb1ukAG8yM986531RoZEZafPJybfkeNidVo5gIe8cu9TKlGgX7HjGeXddOCnzFKyZjN0XMePz7Hxn/lJP+b/DcD4fmBOXCCaIHJ+9z21Ki8Gre/QMaeCB8CKDnio0cmkvGgKSPSDuupd7tDWy7pbUTNdNxVF9X1JxpBUyqhRzQR68cb9GCeulNzC/bGjHwoVPJRdhudze6GJ9uHA9VSZL528/UloMjs+ZAfO8/UuA5b3XV2Y/qfZd1RjmndIvCEV6bezEDLcZZqQ52mfyU9DowvrDhn5uqr8zf4aeFLkzPSXwxnhiyZW/APPQAWMkAzquS9w1dmYfezu0m809usjxYafBDw+zDwsnCVZ5LBlQWclB/8co0jRvAnSZ1eucMrFJDwqBUnEELs4qrrUEXTsyjJQK7lusuMs2MoW/km7ZQTQmmm7wPndhrWaytbaEopr4aHW6U0no14QIp7UXfjeSM1OPzEqt8smJSJ3/k93ZY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d2103e-65d5-4141-18ff-08de6e463f22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:01:51.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbZLbQemjgxgU5gTmbgew0LO7ffR/b/cgAk+0TtuWjQ5NBJtTjEpDicXI3iCuU/4RmReh843cKyCCSIT2ypBostuaLMCu4K8WfmMsnH349Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzOCBTYWx0ZWRfX6rbtggNHSx5M
 7eoedVKKeCsfj45uHmIwuB3oX+SzFePAKd/CUPiQlhOrQHixmtdRNYMbbYcWkjTXFOXpGPbF8rO
 xiSMWo/l36MXThgCrFqr82SVPopqhMd/foPCSfwSynydI4dLwH0hIc/1WTXgkC7pGjQQYr8up6N
 AYKL+3d72jUjPJvxQarMxxLmnLe/NsTky458MGBel8nGZ7Qbr7bELj9FM2qj+RIeSiokP3h0HsZ
 K7feOt3VvDAvijbg9VHMTt5dXQvRhOgk3oWK34xD8/QzXGklnY3IBmOcLC5upI35e8eo+uDTRIu
 I6R2rpmXuvQ65jm4CctqbZzzgVjNWocgZJOsxeiq9MTXzc0jXGdD+4v/53f1hOfaAnU20htyoAT
 MXmAtqoXowXg+aJlBcoPjuYSkZzqYfq+deQoqcUhfJ0Gv0zN9FTOxOrTuI1JXc/HVR5CzLu8f0H
 OxYCBC7si1i8bzKnWjQ==
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=69949f07 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=7JjCn9bmj-kuPwuGg68A:9
X-Proofpoint-GUID: k6o4ww7CLzCMfPsrBoo6wpzrEE82yT9_
X-Proofpoint-ORIG-GUID: k6o4ww7CLzCMfPsrBoo6wpzrEE82yT9_

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index fadac05e..f10c7f4d 100755
--- a/configure
+++ b/configure
@@ -123,6 +123,11 @@ rm -rf build/.config.new build/.config-vars.mk.new
 echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
 trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
 
+# Should we report unknown --disable/enable/with/without-* options?
+if echo " $@ " | grep ' --disable-option-checking ' &>/dev/null; then
+   no_check_opts=t
+fi
+
 for option in "$@"; do
     case "$option" in
         --help) help; exit 1;;
@@ -174,6 +179,11 @@ for option in "$@"; do
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
         --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
         --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
+        --disable-*|--enable-*|--with-*|--without-*)
+           if [[ -z $no_check_opts ]]; then
+              echo "Unknown option $option" >&2
+              exit 1
+           fi;;
         *) echo "Unknown option $option" >&2
            exit 1;;
     esac
-- 
2.51.0

